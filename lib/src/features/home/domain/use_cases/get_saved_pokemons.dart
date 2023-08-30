import 'package:dartz/dartz.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';
import 'package:pokedex/src/features/home/domain/use_cases/api_base_use_case.dart';

class GetSavedPokemonsCase extends ApiBaseUseCase<List<Pokemon>> {
  final Repository _repository;
  GetSavedPokemonsCase(this._repository);

  @override
  Future<Either<String, List<Pokemon>>> call() async {
    return _repository.getSavedPokemons();
  }
}
