import 'package:dio/dio.dart';
import 'package:festiva/core/storage/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.getToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await _refreshToken();

      if (newToken != null) {
        err.requestOptions.headers["Authorization"] = "Bearer $newToken";
        return handler.resolve(await Dio().fetch(err.requestOptions));
      }
    }

    return handler.next(err);
  }

  Future<String?> _refreshToken() async {
    final refreshToken = await _secureStorage.getRefreshToken();

    if (refreshToken == null) return null;

    try {
      final response = await Dio().post(
        "https://api.tuapp.com/auth/refresh",
        data: {"refresh_token": refreshToken},
      );

      final newToken = response.data["access_token"];
      await _secureStorage.saveToken(newToken);

      return newToken;
    } catch (e) {
      await _secureStorage.clearTokens();
      return null;
    }
  }
}
