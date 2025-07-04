import 'package:festiva/core/storage/secure_storage.dart';
import 'package:festiva/data/model/request/login_request.dart';
import 'package:festiva/data/model/response/login_response.dart';
import 'package:festiva/data/services/auth_service.dart';
import 'package:festiva/domain/model/user.dart';
import 'package:festiva/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService service;

  final SecureStorage _secureStorage = SecureStorage();

  AuthRepositoryImpl(this.service);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final res = await service.login(request);
    await _secureStorage.saveToken(res.token);
    await _secureStorage.saveRefreshToken(res.refreshToken ?? "");
    return res;
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
