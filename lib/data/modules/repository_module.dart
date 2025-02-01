import 'package:festiva_flutter/data/repository/auth_repository_impl.dart';
import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

void repositoryModule(GetIt getIt) {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
