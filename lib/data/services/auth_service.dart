import 'package:festiva_flutter/data/model/request/login_request.dart';
import 'package:festiva_flutter/data/model/response/http_response.dart';
import 'package:festiva_flutter/data/model/response/login_response.dart';
import 'package:festiva_flutter/data/modules/api_service.dart';

class AuthService {
  ApiService api;

  AuthService(this.api);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final res = await api.post(
        url: '/auth/login',
        body: request.toJson(),
      );

      return LoginResponse.fromJson(res.data);
    } on HttpResponse catch (e) {
      if (e.statusCode == 401) {
        throw Exception('Credenciales incorrectas');
      } else if (e.statusCode == 404) {
        throw Exception('Usuario no encontrado');
      } else {
        throw Exception(e.message);
      }
    } catch (e) {
      throw Exception('Error desconocido');
    }
  }
}
