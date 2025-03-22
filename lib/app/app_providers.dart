import 'package:festiva_flutter/core/di/di.dart';
import 'package:festiva_flutter/presentation/pages/home/providers/home_provider.dart';
import 'package:festiva_flutter/presentation/pages/home/providers/home_search_provider.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:festiva_flutter/presentation/pages/menu/menu_provider.dart';
import 'package:festiva_flutter/presentation/providers/artist_provider.dart';
import 'package:festiva_flutter/presentation/providers/club_provider.dart';
import 'package:festiva_flutter/presentation/providers/event_provider.dart';
import 'package:festiva_flutter/presentation/pages/clubs_map/clubs_map_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders() {
  return [
    ChangeNotifierProvider(
      create: (_) => getIt<LoginProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<MenuProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<HomeProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => getIt<HomeSearchProvider>(),
    ),

    // Artist Provider
    ChangeNotifierProvider(
      create: (_) => getIt<ArtistProvider>(),
    ),

    // Club Provider
    ChangeNotifierProvider(
      create: (_) => getIt<ClubProvider>(),
    ),

    // Event Provider
    ChangeNotifierProvider(
      create: (_) => getIt<EventProvider>(),
    ),

    ChangeNotifierProvider(
      create: (_) => getIt<ClubsMapProvider>(),
    ),
  ];
}
