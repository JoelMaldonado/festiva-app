import 'package:festiva/core/storage/prefs.dart';
import 'package:festiva/app/routes.dart';
import 'package:festiva/core/di/di.dart';
import 'package:festiva/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Prefs prefs = getIt<Prefs>();
    String initialRoute =
        prefs.getOnboarding() == true ? '/login' : '/onboarding';

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.colorB1,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'Festiva',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
