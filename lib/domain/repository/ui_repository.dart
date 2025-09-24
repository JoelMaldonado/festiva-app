import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/model/response/ui_response.dart';
import 'package:festiva/domain/model/app_screen_flag.dart';

abstract class UiRepository {
  Future<Either<Failure, FetchUiHomeResponse>> fetchHomeData();
  Future<Either<Failure, List<AppScreenFlag>>> fetchAppScreenFlags();
  Future<Either<Failure, List<UiClub>>> fetchClubs();
  Future<Either<Failure, UiClubDetail>> fetchClubDetail(int clubId);
}
