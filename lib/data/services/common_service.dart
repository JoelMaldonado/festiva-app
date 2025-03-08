import 'package:festiva_flutter/data/model/dto/search_item_dto.dart';
import 'package:festiva_flutter/core/network/dio_config.dart';

class CommonService {
  final DioConfig api;

  CommonService(this.api);

  Future<List<SearchItemDto>> search(String query) async {
    final queryParameters = {
      'q': query,
    };
    final call = await api.get(
      url: '/common/search',
      queryParameters: queryParameters,
    );

    if (call.statusCode != 200) {
      throw Exception('Failed to search');
    }
    final response = call.data as List;
    return response.map((e) => SearchItemDto.fromJson(e)).toList();
  }
}
