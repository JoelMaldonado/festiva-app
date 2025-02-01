import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:get_it/get_it.dart';

void providerModule(GetIt getIt) {
  getIt.registerFactory(() => LoginProvider(repo: getIt<AuthRepository>()));
}
