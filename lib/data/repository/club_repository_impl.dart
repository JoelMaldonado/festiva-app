import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/data/services/club_service.dart';
import 'package:festiva_flutter/domain/model/club.dart';
import 'package:festiva_flutter/domain/repository/club_repository.dart';

class ClubRepositoryImpl implements ClubRepository {
  final ClubService _service;

  ClubRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<Club>>> allClubs() async {
    try {
      final clubs = await _service.fetchAll();
      final map = clubs.map((e) => e.toDomain()).toList();
      return Right(map);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
