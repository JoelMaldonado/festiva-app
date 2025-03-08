import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/domain/model/club.dart';

abstract class ClubRepository {
  Future<Either<Failure, List<Club>>> allClubs();
  Future<Either<Failure, Club>> get(int id);
}
