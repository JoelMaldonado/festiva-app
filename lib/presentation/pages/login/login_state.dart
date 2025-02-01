import 'package:flutter/material.dart';

class LoginState {
  final userController = TextEditingController(text: "joel@gmail.com");
  final passwordController = TextEditingController(text: "1234");
  bool obscureText = true;
  bool rememberMe = false;
  bool isLoading = false;
  String? error;

  void dispose() {
    userController.dispose();
    passwordController.dispose();
  }
}
