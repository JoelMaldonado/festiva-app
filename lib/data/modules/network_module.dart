import 'package:dio/dio.dart';
import 'package:festiva_flutter/data/modules/api_service.dart';
import 'package:get_it/get_it.dart';

void networkModule(GetIt getIt) {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: getIt()));
}
