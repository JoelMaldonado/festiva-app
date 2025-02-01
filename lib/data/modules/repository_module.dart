import 'package:festiva_flutter/data/repository/auth_repository_impl.dart';
import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> repositoryModule(GetIt getIt) async {
  getIt
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
}
