import 'package:flutter/material.dart';

class LoginState {
  final userController = TextEditingController(text: "admin");
  final passwordController = TextEditingController(text: "1234");
  bool rememberMe = false;
  bool isLoading = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
  }

  void dispose() {
    userController.dispose();
    passwordController.dispose();
  }
}
