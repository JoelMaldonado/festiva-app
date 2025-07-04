import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/data/services/common_service.dart';
import 'package:festiva/domain/model/search_item.dart';
import 'package:festiva/domain/repository/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonService _service;

  CommonRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<SearchItem>>> search(String query) async {
    try {
      final res = await _service.search(query);
      if (res.isSuccess) {
        return Right(res.data?.map((e) => e.toDomain()).toList() ?? []);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
