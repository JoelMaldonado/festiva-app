import 'package:festiva_flutter/app/app.dart';
import 'package:festiva_flutter/data/modules/di.dart';
import 'package:festiva_flutter/presentation/pages/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupDependencies();
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
