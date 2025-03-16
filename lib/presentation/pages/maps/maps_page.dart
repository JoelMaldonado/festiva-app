import 'dart:async';

import 'package:festiva_flutter/presentation/providers/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  mp.MapboxMap? mapboxMap;
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
    final pr = Provider.of<ClubProvider>(context, listen: false);
    return Stack(
      children: [
        mp.MapWidget(
          onMapCreated: (controller) {
            _onMapCreated(controller, pr);
          },
          styleUri: mp.MapboxStyles.DARK,
        ),
      ],
    );
  }

  void _onMapCreated(
    mp.MapboxMap controller,
    ClubProvider pr,
  ) async {
    setState(() {
      mapboxMap = controller;
    });

    mapboxMap?.location.updateSettings(
      mp.LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );
    for (var e in pr.locations) {
      final pam = await mapboxMap?.annotations.createPointAnnotationManager();
      final Uint8List imageData = await loadImage(e.logoUrl);
      final pointAnnotationOptions = mp.PointAnnotationOptions(
        image: imageData,
        iconSize: 1,
        geometry: mp.Point(
          coordinates: mp.Position(
            e.longitude,
            e.latitude,
          ),
        ),
      );
      pam?.create(pointAnnotationOptions);
      final myListener = MyPointAnnotationClickListener(prueba: "Hola");
      pam?.addOnPointAnnotationClickListener(myListener);
    }
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
        if (position != null && mapboxMap != null) {
          mapboxMap?.setCamera(
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

  Future<Uint8List> loadImage(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final originalImage = img.decodeImage(response.bodyBytes);

      if (originalImage == null) {
        final ByteData byteData =
            await rootBundle.load('assets/icons/ic_mail.png');
        return byteData.buffer.asUint8List();
      }

      final resizedImage =
          img.copyResize(originalImage, width: 200, height: 200);
      final resizedImageBytes = img.encodePng(resizedImage);
      return resizedImageBytes;
    } else {
      final ByteData byteData =
          await rootBundle.load('assets/icons/ic_mail.png');
      return byteData.buffer.asUint8List();
    }
  }
}

class MyPointAnnotationClickListener extends mp.OnPointAnnotationClickListener {
  final String prueba;

  MyPointAnnotationClickListener({
    required this.prueba,
  });

  @override
  void onPointAnnotationClick(mp.PointAnnotation annotation) {
    print('Annotation clicked $prueba: ${annotation.id}');
  }
}
