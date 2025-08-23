import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/domain/model/club/club_schedule.dart';
import 'package:festiva/domain/model/event.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:flutter/foundation.dart';

class ClubProvider extends ChangeNotifier {
  final ClubRepository repo;
  final UiRepository uiRepo;
  final EventRepository eventRepo;

  ClubProvider({
    required this.repo,
    required this.uiRepo,
    required this.eventRepo,
  });

  List<UiClub> listUiClubs = [];
  bool isLoadingUiClubs = false;

  getClubs() async {
    isLoadingUiClubs = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 500));
    final res = await uiRepo.fetchClubs(1, 100);
    res.fold(
      (l) {},
      (r) => listUiClubs = List.of(r.items),
    );
    isLoadingUiClubs = false;
    notifyListeners();
  }

  UiClubDetail? club;
  bool isLoadingClub = false;
  String? errorMessage;

  List<Event> listEventsByClub = [];

  getClub(int id) async {
    isLoadingClub = true;
    errorMessage = null;
    listEventsByClub = [];
    notifyListeners();

    final res = await uiRepo.fetchClubDetail(id);
    res.fold(
      (l) {
        errorMessage = l.message;
        isLoadingClub = false;
        notifyListeners();
      },
      (r) {
        club = r;
        isLoadingClub = false;
        notifyListeners();
        getClubEvents(id);
      },
    );
  }

  Future<void> getClubEvents(int clubId) async {
    final res = await eventRepo.allEvents(clubId: clubId);
    res.fold(
      (l) {},
      (r) {
        listEventsByClub = List.of(r);
        notifyListeners();
      },
    );
  }

  Future<List<ClubSchedule>> getClubSchedules(int clubId) async {
    final res = await repo.getClubSchedules(clubId);
    return res.fold(
      (l) => [],
      (r) => r,
    );
  }
}
