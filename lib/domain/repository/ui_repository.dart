import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/model/response/ui_response.dart';

abstract class UiRepository {
  Future<Either<Failure, FetchUiClubsResponse>> fetchClubs(int page, int limit);
  Future<Either<Failure, UiClubDetail>> fetchClubDetail(int clubId);
}
