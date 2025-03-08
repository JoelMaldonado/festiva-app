import 'package:festiva_flutter/core/network/dio_config.dart';
import 'package:festiva_flutter/data/model/dto/event_dto.dart';

class EventService {
  final DioConfig _dio;

  EventService(this._dio);

  Future<List<EventDto>> fetchAll() async {
    final call = await _dio.get(url: '/evento');
    return (call.data as List)
        .map((event) => EventDto.fromJson(event))
        .toList();
  }
}
