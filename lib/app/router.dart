import 'package:festiva/presentation/pages/splash/splash_page.dart';
import 'package:festiva/presentation/pages/on_boarding/on_boarding_page.dart';
import 'package:festiva/presentation/pages/login/login_page.dart';
import 'package:festiva/presentation/pages/menu/menu_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onBoarding = '/onboarding';
  static const login = '/login';
  static const menu = '/menu';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
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
  ],
);

// Go -> Navega y reemplaza la ruta actual
// Push -> Navega y agrega la ruta a la pila de navegación
// Pop -> Regresa a la ruta anterior en la pila de navegación
// Replace -> Reemplaza la ruta actual con una nueva ruta

// Named routes -> Permite navegar a rutas específicas por nombre
// Query parameters -> Permite pasar parámetros en la URL
