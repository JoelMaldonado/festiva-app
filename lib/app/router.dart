import 'package:festiva/presentation/pages/artist_detail/artist_detail_page.dart';
import 'package:festiva/presentation/pages/artists/artists_page.dart';
import 'package:festiva/presentation/pages/detail_event/detail_event_page.dart';
import 'package:festiva/presentation/pages/full_screen_image/full_screen_image_page.dart';
import 'package:festiva/presentation/pages/sign_in/sign_in_page.dart';
import 'package:festiva/presentation/pages/splash/splash_page.dart';
import 'package:festiva/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:festiva/presentation/pages/login/login_page.dart';
import 'package:festiva/presentation/pages/menu/menu_page.dart';
import 'package:festiva/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onBoarding = '/onboarding';
  static const login = '/login';
  static const menu = '/menu';
  static const fullScreenImage = '/full-screen-image';
  static const signIn = '/sign-in';
  static const eventDetail = '/event-detail';
  static const artistList = '/artist-list';
  static const artistDetail = '/artist-detail';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) => AppRoutes.splash,
    ),
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.onBoarding,
      builder: (context, state) => OnBoardingPage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.menu,
      builder: (context, state) => MenuPage(),
    ),
    GoRoute(
      path: AppRoutes.fullScreenImage,
      builder: (context, state) {
        final imageUrl = state.extra as String;
        return FullScreenImagePage(imageUrl: imageUrl);
      },
    ),
    GoRoute(
      path: AppRoutes.signIn,
      builder: (context, state) {
        return SignInPage();
      },
    ),
    GoRoute(
      path: AppRoutes.eventDetail,
      builder: (context, state) {
        final idEvent = state.extra as String;
        return DetailEventPage(idEvent: idEvent);
      },
    ),
    GoRoute(
      path: '/app/event-detail/:idEvent',
      builder: (context, state) {
        final idEvent = state.pathParameters['idEvent'] ?? '';
        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            GoRouter.of(context).go(AppRoutes.menu);
          },
          child: DetailEventPage(idEvent: idEvent),
        );
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shell Menu"),
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/uno',
          builder: (context, state) {
            return Column(
              children: [
                Center(child: Text('Uno')),
                AppButton(
                  label: "2",
                  onPressed: () {
                    GoRouter.of(context).push('/dos');
                  },
                )
              ],
            );
          },
        ),
        GoRoute(
          path: '/dos',
          builder: (context, state) {
            return Center(child: Text('Dos'));
          },
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.artistList,
      builder: (context, state) {
        return ArtistsPage();
      },
    ),
    GoRoute(
      path: AppRoutes.artistDetail,
      builder: (context, state) {
        final idArtist = state.extra as int;
        return ArtistDetailPage(idArtist: idArtist);
      },
    )
  ],
);

// Go -> Navega y reemplaza la ruta actual
// Push -> Navega y agrega la ruta a la pila de navegación
// Pop -> Regresa a la ruta anterior en la pila de navegación
// Replace -> Reemplaza la ruta actual con una nueva ruta

// Named routes -> Permite navegar a rutas específicas por nombre
// Query parameters -> Permite pasar parámetros en la URL
