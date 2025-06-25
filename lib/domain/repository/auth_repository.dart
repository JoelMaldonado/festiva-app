import 'package:festiva/data/model/request/login_request.dart';
import 'package:festiva/data/model/response/login_response.dart';
import 'package:festiva/domain/model/user.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<User> register(String email, String password);
  Future<void> logout();
}
