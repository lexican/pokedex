import 'package:pokedex/src/core/models/pokemon/pokemon.dart';

abstract class LocalDataSource {
  Future<void> initializeDb();
  Future<void> clearDb();
  Future<void> add(Pokemon pokemon);
  Future<void> remove(Pokemon pokemon);
  Future<void> addAll(List<Pokemon> pokemons);
  List<Pokemon> getAll();
}
