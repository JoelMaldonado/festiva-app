import 'package:dartz/dartz.dart';
import 'package:festiva_flutter/core/error/failure.dart';
import 'package:festiva_flutter/domain/model/search_item.dart';

abstract class CommonRepository {
  Future<Either<Failure, List<SearchItem>>> search(String query);
}
