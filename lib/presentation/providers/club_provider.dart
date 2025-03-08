import 'package:festiva_flutter/domain/model/club.dart';
import 'package:festiva_flutter/domain/repository/club_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClubProvider extends ChangeNotifier {
  final ClubRepository _repo;

  ClubProvider(this._repo);

  List<Club> clubs = [];

  bool isLoadingArtists = false;

  getClubs() async {
    try {
      if (clubs.isNotEmpty) return;
      isLoadingArtists = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.allClubs();
      res.fold(
        (l) {},
        (r) => clubs = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingArtists = false;
      notifyListeners();
    }
  }

  Club? club;
  bool isLoadingClub = false;

  getClub(int id) async {
    try {
      isLoadingClub = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.get(id);
      res.fold(
        (l) {},
        (r) => club = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingClub = false;
      notifyListeners();
    }
  }
}
