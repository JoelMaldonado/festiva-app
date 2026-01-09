import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/domain/model/artist.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final UiRepository uiRepo;

  HomeProvider({
    required this.uiRepo,
  });

  List<UiClub> listClubs = [];
  List<Event> listEventSchedules = [];
  List<Artist> listArtists = [];

  bool isLoading = false;

  Future<void> loadData() async {
    isLoading = true;
    notifyListeners();
    final res = await uiRepo.fetchHomeData();

    res.fold(
      (l) {},
      (r) {
        listClubs = List.of(r.clubs);
        listEventSchedules = r.events.map((e) => e.toDomain()).toList();
        listArtists = r.artists.map((e) => e.toDomain()).toList();
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
