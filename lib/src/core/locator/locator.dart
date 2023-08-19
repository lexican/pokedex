import 'package:get_it/get_it.dart';
import 'package:pokedex/src/core/api/api_client.dart';
import 'package:pokedex/src/core/constants/api_config.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/repositories/repository_imp.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  ApiClient apiClient = ApiClient(ApiConfig.baseUrl);
  LocalDataSourceImp localDataSourceImp = LocalDataSourceImp();
  locator.registerLazySingleton(
    () => RepositoryImp(
      localDataSource: localDataSourceImp,
      remoteDataSource: RemoteDataSourceImp(apiClient: apiClient),
    ),
  );
  locator.registerLazySingleton(() => localDataSourceImp);
  locator.registerLazySingleton(() => apiClient);
}
