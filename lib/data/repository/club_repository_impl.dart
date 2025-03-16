import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/data/services/club_service.dart';
import 'package:festiva_flutter/domain/model/club/club.dart';
import 'package:festiva_flutter/domain/model/club/club_location.dart';
import 'package:festiva_flutter/domain/model/club/club_summary.dart';
import 'package:festiva_flutter/domain/repository/club_repository.dart';

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
      final club = await _service.fetch(id);
      return Right(club.toDomain());
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
}
