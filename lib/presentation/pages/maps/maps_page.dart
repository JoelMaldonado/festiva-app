import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  mp.MapboxMap? mapboxMapController;
  StreamSubscription? userPositionStream;

  @override
  void initState() {
    super.initState();
    _setupPositionTracking();
  }

  @override
  void dispose() {
    userPositionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        mp.MapWidget(
          onMapCreated: _onMapCreated,
          styleUri: mp.MapboxStyles.DARK,
        ),
      ],
    );
  }

  void _onMapCreated(
    mp.MapboxMap controller,
  ) async {
    setState(() {
      mapboxMapController = controller;
    });

    mapboxMapController?.location.updateSettings(
      mp.LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );

    final pointAnnotationManager =
        await mapboxMapController?.annotations.createPointAnnotationManager();
    final Uint8List imageData = await loadImage();
    final pointAnnotationOptions = mp.PointAnnotationOptions(
      image: imageData,
      iconSize: 1.5,
      geometry: mp.Point(
        coordinates: mp.Position(
          -76.141776,
          -13.416852,
        ),
      ),
    );

    pointAnnotationManager?.create(pointAnnotationOptions);
  }

  Future<void> _setupPositionTracking() async {
    bool serviceEnabled;
    gl.LocationPermission permission;
    serviceEnabled = await gl.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await gl.Geolocator.checkPermission();
    if (permission == gl.LocationPermission.denied) {
      permission = await gl.Geolocator.requestPermission();
      if (permission == gl.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == gl.LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    gl.LocationSettings locationSettings = gl.LocationSettings(
      accuracy: gl.LocationAccuracy.high,
      distanceFilter: 100,
    );

    userPositionStream?.cancel();
    userPositionStream =
        gl.Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen(
      (gl.Position? position) {
        if (position != null && mapboxMapController != null) {
          mapboxMapController?.setCamera(
            mp.CameraOptions(
              zoom: 15,
              center: mp.Point(
                coordinates: mp.Position(
                  position.longitude,
                  position.latitude,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<Uint8List> loadImage() async {
    final ByteData byteData = await rootBundle.load('assets/icons/ic_mail.png');
    return byteData.buffer.asUint8List();
  }
}
