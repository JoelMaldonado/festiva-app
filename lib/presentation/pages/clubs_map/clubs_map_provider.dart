import 'dart:async';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class ClubsMapProvider extends ChangeNotifier {
  final ClubRepository repo;
  final ImageCacheService imageCacheService;

  ClubsMapProvider({
    required this.repo,
    required this.imageCacheService,
  });

  ClubLocation? clubSelected;
  final List<mp.PointAnnotationOptions> locations = [];

  Future<void> getClubLocations() async {
    if (locations.isNotEmpty) {
      return;
    }
    locations.clear();
    final res = await repo.getLocations();
    res.fold(
      (l) {},
      (r) => mapLocationsToMarkers(r),
    );
  }

  mapLocationsToMarkers(List<ClubLocation> list) async {
    final futures = list.map((club) async {
      final filename = '${club.idClub}.png';
      final imgData =
          await imageCacheService.getCachedOrDownload(club.logoUrl, filename);

      final geometry = mp.Point(
        coordinates: mp.Position(
          club.longitude,
          club.latitude,
        ),
      );

      return mp.PointAnnotationOptions(
        geometry: geometry,
        image: imgData,
        iconSize: 1.0,
      );
    }).toList();

    final points = await Future.wait(futures);

    locations.addAll(points);
    notifyListeners();
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

  //final myListener = MyPointAnnotationClickListener(
  //  clubLocation: e,
  //  onPressed: getClubById,
  //);
  //pam?.addOnPointAnnotationClickListener(myListener);
}
