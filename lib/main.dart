import 'package:festiva_flutter/app/app.dart';
import 'package:festiva_flutter/data/modules/di.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => getIt<LoginProvider>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
