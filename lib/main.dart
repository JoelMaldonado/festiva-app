import 'dart:io';

import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:festiva/app/app.dart';
import 'package:festiva/app/app_providers.dart';
import 'package:festiva/core/di/di.dart';
import 'package:festiva/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/web.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:tiktok_events_sdk/tiktok_events_sdk.dart';

final tagito = Logger();
final fbAppEvents = FacebookAppEvents();

Future<void> initTracking() async {
  if (Platform.isIOS) {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    final authorized = status == TrackingStatus.authorized;
    await fbAppEvents.setAdvertiserTracking(enabled: authorized);
    await fbAppEvents.setAutoLogAppEventsEnabled(true);
  }
}

Future<void> initTikTok() async {
  final iosOptions = TikTokIosOptions(
    disableTracking: false,
    disableAutomaticTracking: true,
    disableSKAdNetworkSupport: false,
  );

  final androidOptions = TikTokAndroidOptions(
    disableAutoStart: false,
    enableAutoIapTrack: false,
    disableAdvertiserIDCollection: false,
  );

  await TikTokEventsSdk.initSdk(
    androidAppId: '7553487830857973767',
    tikTokAndroidId: 'com.festiva.core',
    iosAppId: '6746812825',
    tiktokIosId: '7553485791444484114',
    isDebugMode: kDebugMode,
    logLevel: kDebugMode ? TikTokLogLevel.debug : TikTokLogLevel.none,
    androidOptions: androidOptions,
    iosOptions: iosOptions,
  );
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

  await initTikTok();

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
