import 'package:festiva/domain/repository/artist_repository.dart';
import 'package:festiva/domain/repository/auth_repository.dart';
import 'package:festiva/domain/repository/club_repository.dart';
import 'package:festiva/domain/repository/common_repository.dart';
import 'package:festiva/domain/repository/event_repository.dart';
import 'package:festiva/domain/repository/ui_repository.dart';
import 'package:festiva/domain/usecase/get_all_club_locations_use_case.dart';
import 'package:festiva/presentation/pages/events_list/events_list_provider.dart';
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
  getIt.registerFactory(
    () => MenuProvider(
      uiRepository: getIt<UiRepository>(),
    ),
  );

  // Home
  getIt.registerFactory(
    () => HomeProvider(
      eventRepository: getIt<EventRepository>(),
      clubRepository: getIt<ClubRepository>(),
      artistRepository: getIt<ArtistRepository>(),
      uiRepo: getIt<UiRepository>(),
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
      repo: getIt<ClubRepository>(),
      uiRepo: getIt<UiRepository>(),
      eventRepo: getIt<EventRepository>(),
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
      getAllClubLocationsUseCase: getIt<GetAllClubLocationsUseCase>(),
    ),
  );

  getIt.registerFactory(
    () => EventsListProvider(
      repo: getIt<EventRepository>(),
    ),
  );
}
