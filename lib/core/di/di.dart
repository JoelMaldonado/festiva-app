import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/core/di/provider_module.dart';
import 'package:festiva/core/di/repository_module.dart';
import 'package:festiva/core/di/service_module.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/usecase/get_all_club_locations_use_case.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Dio Config
  getIt.registerLazySingleton<DioConfig>(() => DioConfig());

  await serviceModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);

  getIt.registerFactory<GetAllClubLocationsUseCase>(
    () => GetAllClubLocationsUseCase(
      repo: getIt<ClubRepository>(),
    ),
  );

  await getIt.allReady();
}
