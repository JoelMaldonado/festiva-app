import 'package:festiva_flutter/data/model/request/login_request.dart';
import 'package:festiva_flutter/data/model/response/api_exception.dart';
import 'package:festiva_flutter/data/model/response/login_response.dart';
import 'package:festiva_flutter/data/services/auth_service.dart';
import 'package:festiva_flutter/domain/model/user.dart';
import 'package:festiva_flutter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      return await service.login(request);
    } on ApiException catch (e) {
      throw Exception(e.error);
    } catch (e) {
      throw Exception('Error desconocido');
    }
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password) {
    throw UnimplementedError();
  }
}
