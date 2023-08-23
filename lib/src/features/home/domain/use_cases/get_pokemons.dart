import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/data/repositories/repository_imp.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';

import 'api_base_use_case.dart';

class GetPokemonsCase extends ApiBaseUseCase<List<Pokemon>> {
  final Repository _repository = locator<RepositoryImp>();

  @override
  Future<Either<String, List<Pokemon>>> call({int? offset, int? limit}) =>
      _repository.getPokemons(offset: offset, limit: limit);
}
