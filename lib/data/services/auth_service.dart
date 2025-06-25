import 'package:festiva/data/model/request/login_request.dart';
import 'package:festiva/data/model/response/login_response.dart';
import 'package:festiva/core/network/dio_config.dart';

class AuthService {
  DioConfig api;

  AuthService(this.api);

  Future<LoginResponse> login(LoginRequest request) async {
    final call = await api.post(
      url: '/auth/login',
      body: request.toJson(),
    );
    return LoginResponse.fromJson(call.data);
  }
}
