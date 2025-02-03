import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:festiva_flutter/presentation/pages/menu/menu_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> providerModule(GetIt getIt) async {
  getIt.registerFactory(() => LoginProvider(repo: getIt<AuthRepository>()));
  getIt.registerFactory(() => MenuProvider());
}
