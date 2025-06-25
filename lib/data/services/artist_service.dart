import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/model/dto/artist_dto.dart';
import 'package:festiva/data/model/response/api_response.dart';

class ArtistService {
  final DioConfig _dio;

  ArtistService(this._dio);

  Future<ApiResponse<List<ArtistDto>>> fetchAll() async {
    final call = await _dio.get(url: '/artist');
    final response = ApiResponse<List<ArtistDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => ArtistDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }

  Future<ApiResponse<ArtistDto>> fetch(int id) async {
    final call = await _dio.get(url: '/artist/$id');
    final response = ApiResponse<ArtistDto>.fromJson(
      call.data,
      (json) => ArtistDto.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }
}
