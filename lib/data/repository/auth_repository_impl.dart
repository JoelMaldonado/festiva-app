import 'package:festiva_flutter/domain/model/user.dart';
import 'package:festiva_flutter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    return User(name: email);
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
