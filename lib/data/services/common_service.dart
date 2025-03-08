import 'package:festiva_flutter/data/model/dto/cat_event_dto.dart';
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
    final response = call.data as List;
    return response.map((e) => SearchItemDto.fromJson(e)).toList();
  }

  Future<List<CatEventDto>> fetchCatEvents() async {
    final call = await api.get(
      url: '/cat-evento',
    );
    final response = call.data as List;
    return response.map((e) => CatEventDto.fromJson(e)).toList();
  }
}
