import 'package:festiva_flutter/data/services/auth_service.dart';
import 'package:get_it/get_it.dart';

void serviceModule(GetIt getIt) {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
}
