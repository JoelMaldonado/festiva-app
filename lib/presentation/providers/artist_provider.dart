import 'package:festiva_flutter/domain/model/artist.dart';
import 'package:festiva_flutter/domain/repository/artist_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArtistProvider extends ChangeNotifier {
  final ArtistRepository _repo;

  ArtistProvider(this._repo);

  List<Artist> artists = [];
  bool isLoadingArtists = false;

  getArtists() async {
    try {
      if (artists.isNotEmpty) return;
      isLoadingArtists = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.allArtists();
      res.fold(
        (l) {},
        (r) => artists = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingArtists = false;
      notifyListeners();
    }
  }

  Artist? artist;
  bool isLoadingArtist = false;

  getArtist(int id) async {
    try {
      isLoadingArtist = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 300));
      final res = await _repo.get(id);
      res.fold(
        (l) {},
        (r) => artist = r,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoadingArtist = false;
      notifyListeners();
    }
  }
}
