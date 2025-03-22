import 'package:festiva_flutter/domain/model/club/club.dart';
import 'package:festiva_flutter/domain/model/club/club_summary.dart';
import 'package:festiva_flutter/domain/repository/club_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClubProvider extends ChangeNotifier {
  final ClubRepository _repo;

  ClubProvider(this._repo);

  List<ClubSummary> clubs = [];

  bool isLoadingClubs = false;

  getClubs() async {
    try {
      if (clubs.isNotEmpty) return;
      isLoadingClubs = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.allSummary();
      res.fold(
        (l) {},
        (r) => clubs = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingClubs = false;
      notifyListeners();
    }
  }

  Club? club;
  bool isLoadingClub = false;
  String? errorMessage;

  getClub(int id) async {
    try {
      isLoadingClub = true;
      errorMessage = null;
      notifyListeners();

      await Future.delayed(Duration(milliseconds: 300));

      final res = await _repo.get(id);
      res.fold(
        (l) {
          errorMessage = l.message;
          club = null;
        },
        (r) {
          errorMessage = null;
          club = r;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      club = null;
    } finally {
      isLoadingClub = false;
      notifyListeners();
    }
  }
}
