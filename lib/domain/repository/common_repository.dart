import 'package:festiva_flutter/domain/model/search_item.dart';

abstract class CommonRepository {
  Future<List<SearchItem>> search(String query);
}
