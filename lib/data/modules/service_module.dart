import 'package:festiva_flutter/app/prefs.dart';
import 'package:festiva_flutter/data/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> serviceModule(GetIt getIt) async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => Prefs(prefs));
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt()));
}
