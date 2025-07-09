import 'dart:async';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/usecase/get_all_club_locations_use_case.dart';
import 'package:festiva/main.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class ClubsMapProvider extends ChangeNotifier {
  final GetAllClubLocationsUseCase getAllClubLocationsUseCase;

  ClubsMapProvider({
    required this.getAllClubLocationsUseCase,
  });

  ClubLocation? clubSelected;
  final List<mp.PointAnnotationOptions> locations = [];

  Future<void> getClubLocations() async {
    try {
      if (locations.isNotEmpty) return;
      locations.clear();
      final points = await getAllClubLocationsUseCase();
      locations.addAll(points);
      notifyListeners();
    } catch (e) {
      tagito.e("ERROR_GET_CLUB_LOCATIONS: $e");
    }
  }
}
