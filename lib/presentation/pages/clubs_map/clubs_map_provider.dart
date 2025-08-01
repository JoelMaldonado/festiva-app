import 'dart:async';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/usecase/get_all_club_locations_use_case.dart';
import 'package:festiva/main.dart';
import 'package:flutter/material.dart';

class ClubsMapProvider extends ChangeNotifier {
  final GetAllClubLocationsUseCase getAllClubLocationsUseCase;

  ClubsMapProvider({
    required this.getAllClubLocationsUseCase,
  });

  ClubLocation? clubSelected;
  List<ClubLocation> locations = [];
  bool isLoading = false;

  void setClub(ClubLocation? club) {
    clubSelected = club;
    notifyListeners();
  }

  Future<void> getClubLocations() async {
    isLoading = true;
    notifyListeners();
    locations = await getAllClubLocationsUseCase();
    tagito.d("CLUBS_MAP: ${locations.length} locations loaded");
    isLoading = false;
    notifyListeners();
  }
}
