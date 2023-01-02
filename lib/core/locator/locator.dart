import 'package:get_it/get_it.dart';
import 'package:pokedex/core/api/api_provider.dart';
import 'package:pokedex/core/services/api/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiProvider());
  locator.registerLazySingleton(() => ApiService());
}
