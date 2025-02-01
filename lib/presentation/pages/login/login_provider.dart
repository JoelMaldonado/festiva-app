import 'package:festiva_flutter/presentation/pages/login/login_state.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final LoginState _state = LoginState();
  LoginState get state => _state;

  void toggleRememberMe() {
    _state.toggleRememberMe();
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _state.dispose();
  }
}
