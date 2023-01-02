import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/api/api_provider.dart';
import 'package:pokedex/src/core/services/api/api_service.dart';
import 'package:pokedex/src/core/services/database/database_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiProvider());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => DatabaseService());
}
