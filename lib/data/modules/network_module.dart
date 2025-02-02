import 'package:festiva_flutter/data/modules/api_service.dart';
import 'package:get_it/get_it.dart';

Future<void> networkModule(GetIt getIt) async {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
}
