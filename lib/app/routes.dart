import 'package:festiva_flutter/presentation/pages/login/login_page.dart';
import 'package:festiva_flutter/presentation/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/onboarding': (context) => OnBoardingScreen(),
  '/login': (context) => LoginPage(),
};
