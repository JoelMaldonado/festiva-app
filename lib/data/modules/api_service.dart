import 'package:dio/dio.dart';
import 'package:festiva_flutter/data/model/response/api_exception.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  }) {
    dio.options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final options = token != null
        ? Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          )
        : null;
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<dynamic>> post<T>({
    required String url,
    T? body,
    String? token,
  }) async {
    try {
      final options = token != null
          ? Options(headers: {'Authorization': 'Bearer $token'})
          : null;

      final response = await dio.post(
        url,
        data: body,
        options: options,
      );

      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Response<dynamic> _handleResponse(Response<dynamic> response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw ApiException(
        message: response.statusMessage ?? 'Error desconocido',
        error: response.data.toString(),
        statusCode: response.statusCode ?? 500,
      );
    }
  }

  ApiException _handleDioError(DioException e) {
    if (e.response != null) {
      final data = ApiException.fromJson(e.response!.data);
      return data;
    } else {
      return ApiException(
        message: 'Error de conexión',
        error: "No se pudo conectar al servidor",
        statusCode: 500,
      );
    }
  }
}
