import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:festiva_flutter/presentation/pages/login/login_state.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository repo;

  LoginProvider({
    required this.repo,
  });

  final LoginState _state = LoginState();
  LoginState get state => _state;

  Future<void> login() async {
    try {
      _state.isLoading = true;
      notifyListeners();
      await Future.delayed(Duration(seconds: 2));
      final res = await repo.login(_state.toRequest());
      print("Si obtuvo info: ${res.token}");
    } catch (e) {
      print("Error del viewmodel: ${e.toString()}");
      _state.error = e.toString();
    } finally {
      _state.isLoading = false;
      notifyListeners();
    }
  }

  void toggleRememberMe() {
    _state.rememberMe = !_state.rememberMe;
    notifyListeners();
  }

  void toggleObscureText() {
    _state.obscureText = !_state.obscureText;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _state.dispose();
  }
}
