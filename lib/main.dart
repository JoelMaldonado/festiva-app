import 'dart:io';

import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:festiva/app/app.dart';
import 'package:festiva/app/app_providers.dart';
import 'package:festiva/core/di/di.dart';
import 'package:festiva/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/web.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

final tagito = Logger();
final fbAppEvents = FacebookAppEvents();

Future<void> initTracking() async {
  if (Platform.isIOS) {
    // 1) ATT
    final status = await AppTrackingTransparency.requestTrackingAuthorization();

    final authorized = status == TrackingStatus.authorized;

    // 2) ATE (imprescindible en iOS 14+)
    await fbAppEvents.setAdvertiserTracking(enabled: authorized);

    // 3) Auto-log (para que el SDK envíe activate_app y otros)
    await fbAppEvents.setAutoLogAppEventsEnabled(true);
  }
}

Future<void> setup() async {
  await dotenv.load(fileName: ".env");
  MapboxOptions.setAccessToken(
    dotenv.env["MAPBOX_ACCESS_TOKEN"]!,
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await setupDependencies();

  await initTracking();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: appProviders(),
      child: const MyApp(),
    ),
  );
}
