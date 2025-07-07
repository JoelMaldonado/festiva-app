import 'package:festiva/data/model/response/api_exception.dart';
import 'package:festiva/domain/repository/auth_repository.dart';
import 'package:festiva/presentation/pages/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      await repo.login(_state.toRequest());
      _state.onSuccess?.call();
    } on ApiException catch (e) {
      _state.error = e.message;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      _state.isLoading = false;
      notifyListeners();
    }
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
