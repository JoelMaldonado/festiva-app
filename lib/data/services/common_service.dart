import 'package:festiva_flutter/data/model/dto/search_item_dto.dart';
import 'package:festiva_flutter/core/network/dio_config.dart';
import 'package:festiva_flutter/data/model/response/api_response.dart';

class CommonService {
  final DioConfig api;

  CommonService(this.api);

  Future<ApiResponse<List<SearchItemDto>>> search(String query) async {
    final queryParameters = {
      'q': query,
    };
    final call = await api.get(
      url: '/common/search',
      queryParameters: queryParameters,
    );
    final response = ApiResponse.fromJson(
      call.data,
      (json) => (json as List).map((e) => SearchItemDto.fromJson(e)).toList(),
    );
    return response;
  }
}
