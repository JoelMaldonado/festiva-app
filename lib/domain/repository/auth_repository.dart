import 'package:festiva_flutter/domain/model/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<void> logout();
}
