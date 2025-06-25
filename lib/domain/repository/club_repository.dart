import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/domain/model/club/club.dart';
import 'package:festiva/domain/model/club/club_location.dart';
import 'package:festiva/domain/model/club/club_summary.dart';

abstract class ClubRepository {
  Future<Either<Failure, List<ClubSummary>>> allSummary();
  Future<Either<Failure, Club>> get(int id);
  Future<Either<Failure, List<ClubLocation>>> getLocations();
}
