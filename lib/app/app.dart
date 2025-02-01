import 'package:festiva_flutter/presentation/pages/login/login_page.dart';
import 'package:festiva_flutter/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Festiva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: AppColors.colorScheme,
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
