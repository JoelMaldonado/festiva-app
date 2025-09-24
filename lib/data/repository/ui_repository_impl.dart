import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/data/services/ui_service.dart';
import 'package:festiva/domain/model/app_screen_flag.dart';
import 'package:festiva/domain/repository/ui_repository.dart';

class UiRepositoryImpl implements UiRepository {
  final UiService service;

  UiRepositoryImpl({
    required this.service,
  });

  @override
  Future<Either<Failure, FetchUiHomeResponse>> fetchHomeData() async {
    try {
      final res = await service.fetchHomeData();
      if (res.isSuccess) {
        return Right(res.data!);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AppScreenFlag>>> fetchAppScreenFlags() async {
    try {
      final res = await service.fetchAppScreenFlags();
      if (res.isSuccess) {
        return Right(res.data!.map((e) => e.toDomain()).toList());
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UiClub>>> fetchClubs() async {
    try {
      final res = await service.fetchClubs();
      if (res.isSuccess) {
        return Right(res.data!);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UiClubDetail>> fetchClubDetail(int clubId) async {
    try {
      final res = await service.fetchClubDetail(clubId);
      if (res.isSuccess) {
        return Right(res.data!);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
