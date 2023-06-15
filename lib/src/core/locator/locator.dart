import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/api/api_client.dart';
import 'package:pokedex/src/core/constants/app_constants.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/repositories/repository_imp.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LocalDataSourceImp());
  locator.registerLazySingleton(() => RemoteDataSourceImp());
  locator.registerLazySingleton(() => RepositoryImp());
  locator.registerLazySingleton(() => ApiClient(baseUrl));
}
