import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/model/mappers/club.mapper.dart';
import 'package:festiva/data/services/club_service.dart';
import 'package:festiva/domain/model/club/club.dart';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/model/club/club_schedule.dart';
import 'package:festiva/domain/model/club/club_summary.dart';
import 'package:festiva/domain/repository/club_repository.dart';

class ClubRepositoryImpl implements ClubRepository {
  final ClubService _service;

  ClubRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<ClubSummary>>> allSummary() async {
    try {
      final res = await _service.fetchAll();
      if (res.isSuccess) {
        final map = res.data?.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Club>> get(int id) async {
    try {
      final res = await _service.fetch(id);
      if (res.isSuccess) {
        final club = res.data?.toDomain();
        if (club != null) {
          return Right(club);
        } else {
          return Left(Failure('Club not found'));
        }
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClubLocation>>> getLocations() async {
    try {
      final res = await _service.fetchLocations();
      if (res.isSuccess) {
        final map = res.data?.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ClubSchedule>>> getClubSchedules(
      int clubId) async {
    try {
      final res = await _service.fetchClubSchedules(clubId);
      if (res.isSuccess) {
        final map = res.data?.map((e) => e.toDomain()).toList();
        return Right(map ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
