import 'package:festiva_flutter/app/app.dart';
import 'package:festiva_flutter/data/modules/di.dart';
import 'package:festiva_flutter/presentation/pages/home/home_page.dart';
import 'package:festiva_flutter/presentation/pages/home/home_provider.dart';
import 'package:festiva_flutter/presentation/pages/login/login_page.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:festiva_flutter/presentation/pages/menu/menu_page.dart';
import 'package:festiva_flutter/presentation/pages/menu/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<LoginProvider>(),
          child: LoginPage(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<MenuProvider>(),
          child: MenuPage(),
        ),
        ChangeNotifierProvider(
          create: (_) => getIt<HomeProvider>(),
          child: const HomePage(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
