import 'package:festiva_flutter/core/network/dio_config.dart';
import 'package:festiva_flutter/data/model/dto/club_dto.dart';

class ClubService {
  final DioConfig _dio;

  ClubService(this._dio);

  Future<List<ClubDto>> fetchAll() async {
    final call = await _dio.get(url: '/discoteca');
    return (call.data as List).map((club) => ClubDto.fromJson(club)).toList();
  }
}
