import 'package:festiva/data/repository/artist_repository_impl.dart';
import 'package:festiva/data/repository/auth_repository_impl.dart';
import 'package:festiva/data/repository/club_repository_impl.dart';
import 'package:festiva/data/repository/common_repository_impl.dart';
import 'package:festiva/data/repository/event_repository_impl.dart';
import 'package:festiva/data/repository/ui_repository_impl.dart';
import 'package:festiva/data/services/artist_service.dart';
import 'package:festiva/data/services/auth_service.dart';
import 'package:festiva/data/services/club_service.dart';
import 'package:festiva/data/services/common_service.dart';
import 'package:festiva/data/services/event_service.dart';
import 'package:festiva/data/services/ui_service.dart';
import 'package:festiva/domain/repository/artist_repository.dart';
import 'package:festiva/domain/repository/auth_repository.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/common_repository.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> repositoryModule(GetIt getIt) async {
  /// Auth Repository
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      getIt<AuthService>(),
    ),
  );

  /// Common Repository
  getIt.registerLazySingleton<CommonRepository>(
    () => CommonRepositoryImpl(
      getIt<CommonService>(),
    ),
  );

  /// Event Repository
  getIt.registerLazySingleton<EventRepository>(
    () => EventRepositoryImpl(
      getIt<EventService>(),
    ),
  );

  /// Club Repository
  getIt.registerLazySingleton<ClubRepository>(
    () => ClubRepositoryImpl(
      getIt<ClubService>(),
    ),
  );

  /// Artist Repository
  getIt.registerLazySingleton<ArtistRepository>(
    () => ArtistRepositoryImpl(
      getIt<ArtistService>(),
    ),
  );

  getIt.registerLazySingleton<UiRepository>(
    () => UiRepositoryImpl(
      service: getIt<UiService>(),
    ),
  );
}
