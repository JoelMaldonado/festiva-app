import 'package:festiva_flutter/core/network/dio_config.dart';
import 'package:festiva_flutter/data/model/dto/artist_dto.dart';

class ArtistService {
  final DioConfig _dio;

  ArtistService(this._dio);

  Future<List<ArtistDto>> fetchAll() async {
    final call = await _dio.get(url: '/artista');
    return (call.data as List)
        .map((artist) => ArtistDto.fromJson(artist))
        .toList();
  }

  Future<ArtistDto> fetch(int id) async {
    final call = await _dio.get(url: '/artista/$id');
    return ArtistDto.fromJson(call.data);
  }
}
