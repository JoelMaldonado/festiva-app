import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/model/response/api_response.dart';
import 'package:festiva/data/model/response/ui_response.dart';

class UiService {
  final DioConfig dio;

  UiService({
    required this.dio,
  });

  Future<ApiResponse<FetchUiClubsResponse>> fetchClubs(
    int page,
    int limit,
  ) async {
    final call = await dio.get(
      url: '/ui/club',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );
    final response = ApiResponse<FetchUiClubsResponse>.fromJson(
      call.data,
      (json) => FetchUiClubsResponse.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }

  Future<ApiResponse<UiClubDetail>> fetchClubDetail(int id) async {
    final call = await dio.get(url: '/ui/club/$id');
    final response = ApiResponse<UiClubDetail>.fromJson(
      call.data,
      (json) => UiClubDetail.fromJson(json as Map<String, dynamic>),
    );
    return response;
  }
}
