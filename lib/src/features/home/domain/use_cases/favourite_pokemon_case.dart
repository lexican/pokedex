import 'package:pokedex/src/features/home/domain/repositories/repository.dart';

class FavouritePokemonCase {
  final Repository _repository;
  FavouritePokemonCase(this._repository);

  Future<void> call(int id) => _repository.favourite(id);
}
