import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/core/di/provider_module.dart';
import 'package:festiva/core/di/repository_module.dart';
import 'package:festiva/core/di/service_module.dart';
import 'package:festiva/util/functions.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Dio Config
  getIt.registerLazySingleton<DioConfig>(() => DioConfig());

  final dir = await getTemporaryDirectory();

  getIt.registerLazySingleton<ImageCacheService>(
    () => ImageCacheService(dir: dir),
  );

  await serviceModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);

  await getIt.allReady();
}
