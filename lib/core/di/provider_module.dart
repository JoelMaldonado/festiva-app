import 'package:festiva/domain/repository/artist_repository.dart';
import 'package:festiva/domain/repository/auth_repository.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/common_repository.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/presentation/pages/home/home_provider.dart';
import 'package:festiva/presentation/pages/search/search_provider.dart';
import 'package:festiva/presentation/pages/login/login_provider.dart';
import 'package:festiva/presentation/pages/menu/menu_provider.dart';
import 'package:festiva/presentation/providers/artist_provider.dart';
import 'package:festiva/presentation/providers/club_provider.dart';
import 'package:festiva/presentation/providers/event_provider.dart';
import 'package:festiva/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> providerModule(GetIt getIt) async {
  getIt.registerFactory(() => LoginProvider(repo: getIt<AuthRepository>()));
  getIt.registerFactory(() => MenuProvider());

  // Home
  getIt.registerFactory(
    () => HomeProvider(
      getIt<EventRepository>(),
    ),
  );
  getIt.registerFactory(
    () => SearchProvider(
      getIt<CommonRepository>(),
    ),
  );

  // Artist Provider
  getIt.registerFactory(
    () => ArtistProvider(
      getIt<ArtistRepository>(),
    ),
  );

  // Club Provider
  getIt.registerFactory(
    () => ClubProvider(
      getIt<ClubRepository>(),
    ),
  );

  // Event Provider
  getIt.registerFactory(
    () => EventProvider(
      getIt<EventRepository>(),
    ),
  );

  getIt.registerFactory(
    () => ClubsMapProvider(
      getIt<ClubRepository>(),
    ),
  );
}
