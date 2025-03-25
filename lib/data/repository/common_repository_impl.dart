import 'package:festiva_flutter/data/services/common_service.dart';
import 'package:festiva_flutter/domain/model/search_item.dart';
import 'package:festiva_flutter/domain/repository/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonService _service;

  CommonRepositoryImpl(this._service);

  @override
  Future<List<SearchItem>> search(String query) async {
    final res = await _service.search(query);
    return res.map((e) => e.toDomain()).toList();
  }
}
