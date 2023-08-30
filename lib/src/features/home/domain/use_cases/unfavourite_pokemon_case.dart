import 'package:pokedex/src/features/home/domain/repositories/repository.dart';

class UnFavouritePokemonCase {
  final Repository _repository;
  UnFavouritePokemonCase(this._repository);

  Future<void> call(int id) => _repository.unFavourite(id);
}
