import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/main.dart';
import 'package:festiva/util/functions.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mp;

class GetAllClubLocationsUseCase {
  final ClubRepository repo;
  final ImageCacheService imageCacheService;

  GetAllClubLocationsUseCase({
    required this.repo,
    required this.imageCacheService,
  });

  Future<List<mp.PointAnnotationOptions>> call() async {
    final res = await repo.getLocations();
    return res.fold(
      (l) => [],
      (r) => _mapLocationsToMarkers(r),
    );
  }

  Future<List<mp.PointAnnotationOptions>> _mapLocationsToMarkers(
    List<ClubLocation> list,
  ) async {
    try {
      final futures = list.map((club) async {
        final filename = '${club.idClub}.png';
        final imgData = await imageCacheService.getCachedOrDownload(
          club.logoUrl,
          filename,
        );

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

      return Future.wait(futures);
    } catch (e) {
      tagito.e("ERROR_GET_CLUB_LOCACTIONS: $e");
      return [];
    }
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
