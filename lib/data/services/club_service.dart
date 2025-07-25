import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/model/dto/club/club_dto.dart';
import 'package:festiva/data/model/dto/club/club_location_dto.dart';
import 'package:festiva/data/model/dto/club/club_schedule_dto.dart';
import 'package:festiva/data/model/dto/club/club_summary_dto.dart';
import 'package:festiva/data/model/response/api_response.dart';

class ClubService {
  final DioConfig _dio;

  ClubService(this._dio);

  Future<ApiResponse<List<ClubSummaryDto>>> fetchAll() async {
    final call = await _dio.get(url: '/club/detail');
    final response = ApiResponse<List<ClubSummaryDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => ClubSummaryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse<ClubDto>> fetch(int id) async {
    final call = await _dio.get(url: '/club/detail/$id');
    final response = ApiResponse<ClubDto>.fromJson(
      call.data,
      (json) => ClubDto.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }

  Future<ApiResponse<List<ClubLocationDto>>> fetchLocations() async {
    final call = await _dio.get(url: '/club/address');
    final response = ApiResponse<List<ClubLocationDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => ClubLocationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

    return response;
  }

  Future<ApiResponse<ClubLocationDto>> fetchLocation(int id) async {
    final call = await _dio.get(url: '/club/address/$id');
    final response = ApiResponse<ClubLocationDto>.fromJson(
      call.data,
      (json) => ClubLocationDto.fromJson(json as Map<String, dynamic>),
    );

    return response;
  }

  Future<ApiResponse<List<ClubScheduleDto>>> fetchClubSchedules(
      int clubId) async {
    final call = await _dio.get(url: '/club-schedule/$clubId');
    final response = ApiResponse<List<ClubScheduleDto>>.fromJson(
      call.data,
      (json) => (json as List<dynamic>)
          .map((e) => ClubScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
    return response;
  }
}
