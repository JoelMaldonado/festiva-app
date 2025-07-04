import 'package:festiva/data/model/request/login_request.dart';
import 'package:flutter/material.dart';

class LoginState {
  final userController = TextEditingController(text: "joel@gmail.com");
  final passwordController = TextEditingController(text: "1234");
  bool obscureText = true;
  bool isLoading = false;
  String? error;

  Function? onSuccess;

  LoginRequest toRequest() {
    return LoginRequest(
      email: userController.text,
      pass: passwordController.text,
    );
  }

  void dispose() {
    userController.dispose();
    passwordController.dispose();
  }
}
