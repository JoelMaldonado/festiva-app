import 'package:festiva_flutter/data/modules/network_module.dart';
import 'package:festiva_flutter/data/modules/provider_module.dart';
import 'package:festiva_flutter/data/modules/repository_module.dart';
import 'package:festiva_flutter/data/modules/service_module.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  await serviceModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);
  await networkModule(getIt);
}
