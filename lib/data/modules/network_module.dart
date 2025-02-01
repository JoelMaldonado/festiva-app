import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void networkModule(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(() => Dio());
  //getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
