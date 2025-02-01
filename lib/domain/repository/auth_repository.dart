import 'package:festiva_flutter/data/model/response/login_response.dart';
import 'package:festiva_flutter/domain/model/user.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}
