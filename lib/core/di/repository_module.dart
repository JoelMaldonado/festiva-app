import 'package:festiva_flutter/data/repository/artist_repository_impl.dart';
import 'package:festiva_flutter/data/repository/auth_repository_impl.dart';
import 'package:festiva_flutter/data/repository/club_repository_impl.dart';
import 'package:festiva_flutter/data/repository/common_repository_impl.dart';
import 'package:festiva_flutter/data/repository/event_repository_impl.dart';
import 'package:festiva_flutter/data/services/artist_service.dart';
import 'package:festiva_flutter/data/services/auth_service.dart';
import 'package:festiva_flutter/data/services/club_service.dart';
import 'package:festiva_flutter/data/services/common_service.dart';
import 'package:festiva_flutter/data/services/event_service.dart';
import 'package:festiva_flutter/domain/repository/artist_repository.dart';
import 'package:festiva_flutter/domain/repository/auth_repository.dart';
import 'package:festiva_flutter/domain/repository/club_repository.dart';
import 'package:festiva_flutter/domain/repository/common_repository.dart';
import 'package:festiva_flutter/domain/repository/event_repository.dart';
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
}
