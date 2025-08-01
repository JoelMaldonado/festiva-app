import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/repository/club_repository.dart';

class GetAllClubLocationsUseCase {
  final ClubRepository repo;

  GetAllClubLocationsUseCase({
    required this.repo,
  });

  Future<List<ClubLocation>> call() async {
    final res = await repo.getLocations();
    return res.fold(
      (l) => [],
      (r) => List.of(r),
    );
  }
}
