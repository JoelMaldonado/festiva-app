import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/model/dto/event_category_dto.dart';
import 'package:festiva/data/model/dto/event_dto.dart';
import 'package:festiva/data/model/response/api_response.dart';

class EventService {
  final DioConfig _dio;

  EventService(this._dio);

  Future<ApiResponse<List<EventDto>>> fetchAll() async {
    final call = await _dio.get(url: '/event');
    final response = ApiResponse<List<EventDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future<ApiResponse<List<EventCategoryDto>>> fetchAllCategories() async {
    final call = await _dio.get(url: '/event/category');
    final response = ApiResponse<List<EventCategoryDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => EventCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future<ApiResponse<EventDto>> fetch(int id) async {
    final call = await _dio.get(url: '/event/$id');

    final response = ApiResponse<EventDto>.fromJson(
      call.data,
      (json) => EventDto.fromJson(json as Map<String, dynamic>),
    );

    return response;
  }
}
