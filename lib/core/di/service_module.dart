import 'package:festiva/core/storage/prefs.dart';
import 'package:festiva/core/network/dio_config.dart';
import 'package:festiva/data/services/artist_service.dart';
import 'package:festiva/data/services/auth_service.dart';
import 'package:festiva/data/services/club_service.dart';
import 'package:festiva/data/services/common_service.dart';
import 'package:festiva/data/services/event_service.dart';
import 'package:festiva/data/services/ui_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> serviceModule(GetIt getIt) async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => Prefs(prefs));
  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt()));
  getIt.registerLazySingleton<CommonService>(
    () => CommonService(
      getIt<DioConfig>(),
    ),
  );

  // Event Service
  getIt.registerLazySingleton<EventService>(
    () => EventService(
      getIt<DioConfig>(),
    ),
  );

  // Club Service
  getIt.registerLazySingleton<ClubService>(
    () => ClubService(
      getIt<DioConfig>(),
    ),
  );

  // Artist Service
  getIt.registerLazySingleton<ArtistService>(
    () => ArtistService(
      getIt<DioConfig>(),
    ),
  );

  getIt.registerLazySingleton<UiService>(
    () => UiService(
      dio: getIt<DioConfig>(),
    ),
  );
}
