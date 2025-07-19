import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:flutter/foundation.dart';

class ClubProvider extends ChangeNotifier {
  final ClubRepository repo;
  final UiRepository uiRepo;

  ClubProvider({
    required this.repo,
    required this.uiRepo,
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

  getClub(int id) async {
    isLoadingClub = true;
    errorMessage = null;
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
      },
    );
  }
}
