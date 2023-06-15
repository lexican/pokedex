import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source_imp.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';

class RepositoryImp extends Repository {
  final RemoteDataSource _remoteDataSource = locator<RemoteDataSourceImp>();
  final LocalDataSource _localDataSource = locator<LocalDataSourceImp>();

  @override
  Future<Either<String, List<Pokemon>>> getPokemons(
      {int? offset, int? limit}) async {
    return _remoteDataSource.getPokemons(offset: offset, limit: limit);
  }

  @override
  Future<Either<String, List<Pokemon>>> getSavedPokemons() async {
    List<int> ids = _localDataSource.getAll();
    return _remoteDataSource.getSavedPokemons(ids);
  }

  @override
  Future<void> favourite(int id) {
    return _localDataSource.add(id);
  }

  @override
  Future<void> unFavourite(int id) {
    return _localDataSource.remove(id);
  }
}
