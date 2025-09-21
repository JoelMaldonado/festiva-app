import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/model/dto/event_category_dto.dart';
import 'package:festiva/data/model/dto/event_dto.dart';
import 'package:festiva/data/model/response/api_response.dart';
import 'package:festiva/data/model/response/event_response.dart';

class EventService {
  final DioConfig _dio;

  EventService(this._dio);

  Future<ApiResponse<List<EventDto>>> fetchAll({
    int? clubId,
  }) async {
    final queryParameters = {
      if (clubId != null) "clubId": clubId,
    };
    final call = await _dio.get(
      url: '/event',
      queryParameters: queryParameters,
    );
    final response = ApiResponse<List<EventDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => EventDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future<ApiResponse<AllEventsPagedResponse>> fetchAllPaged(int page) async {
    final queryParameters = {
      "page": page,
      "limit": 20,
    };
    final call = await _dio.get(
      url: '/event/paged',
      queryParameters: queryParameters,
    );
    final response = ApiResponse<AllEventsPagedResponse>.fromJson(
      call.data,
      (json) => AllEventsPagedResponse.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }

  Future<ApiResponse<List<EventCategoryDto>>> fetchAllCategories() async {
    final call = await _dio.get(url: '/event-category');
    final response = ApiResponse<List<EventCategoryDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => EventCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future<ApiResponse<EventDto>> fetch(String id) async {
    final call = await _dio.get(url: '/event/$id');

    final response = ApiResponse<EventDto>.fromJson(
      call.data,
      (json) => EventDto.fromJson(json as Map<String, dynamic>),
    );

    return response;
  }
}
