import 'package:dartz/dartz.dart';
import 'package:festiva/core/error/failure.dart';
import 'package:festiva/domain/model/search_item.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<SearchItem>>> search(String query);
}
