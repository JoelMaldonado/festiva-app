import 'dart:async';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class ClubsMapProvider extends ChangeNotifier {
  final ClubRepository _repo;

  ClubsMapProvider(this._repo);

  mp.MapboxMap? mapboxMap;
  StreamSubscription? userPositionStream;

  void onMapCreated(
    mp.MapboxMap controller,
  ) async {
    mapboxMap = controller;
    mapboxMap?.location.updateSettings(
      mp.LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
      ),
    );

    await getClubsLocations();
  }

  ClubSummary? clubSelected;

  Future<void> getClubsLocations() async {
    try {
      final res = await _repo.getLocations();
      return res.fold(
        (l) => Fluttertoast.showToast(msg: l.message),
        (r) => setClubsMarker(r),
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      notifyListeners();
    }
  }

  Future<void> setClubsMarker(List<ClubLocation> list) async {
    for (var e in list) {
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
      final myListener = MyPointAnnotationClickListener(
        clubLocation: e,
        onPressed: getClubById,
      );
      pam?.addOnPointAnnotationClickListener(myListener);
    }
  }

  Future<void> getClubById(ClubLocation clubLocation) async {
    final res = await _repo.allSummary();
    res.fold(
      (l) => Fluttertoast.showToast(msg: l.message),
      (r) {
        clubSelected = r.firstWhere((e) => e.id == clubLocation.idClub);
      },
    );
    notifyListeners();
  }

  Future<void> setupPositionTracking() async {
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

  @override
  void dispose() {
    userPositionStream?.cancel();
    super.dispose();
  }
}

class MyPointAnnotationClickListener extends mp.OnPointAnnotationClickListener {
  final ClubLocation clubLocation;
  final Function(ClubLocation) onPressed;

  MyPointAnnotationClickListener({
    required this.clubLocation,
    required this.onPressed,
  });

  @override
  void onPointAnnotationClick(mp.PointAnnotation annotation) {
    onPressed.call(clubLocation);
  }
}
