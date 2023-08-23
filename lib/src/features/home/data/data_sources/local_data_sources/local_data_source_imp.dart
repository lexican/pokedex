import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/utils/utils.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source.dart';
import 'package:pokedex/src/features/home/data/models/database_pokemon.dart';

class LocalDataSourceImp implements LocalDataSource {
  bool _databaseInitialized = false;
  Box? box;

  @override
  Future initializeDb() async {
    if (!_databaseInitialized) {
      await _initializeDb();
    }
    Hive.registerAdapter(DatabasePokemonAdapter());
    box = await Hive.openBox<DatabasePokemon>(HiveBoxName.favourites);

    _databaseInitialized = true;
  }

  Future _initializeDb() async {
    try {
      await Hive.initFlutter();
    } catch (e) {
      logger.i(e);
    }
  }

  @override
  Future<void> add(int id) async {
    try {
      await box?.put(
        id,
        DatabasePokemon(
          id: id,
          createdAt: DateTime.now(),
        ),
      );
    } catch (_) {}
  }

  @override
  Future<void> remove(int id) async {
    try {
      box?.delete(id);
    } catch (_) {}
  }

  @override
  List<int> getAll() {
    try {
      //Sort pokemons by date added
      List<DatabasePokemon> pokemons =
          box!.values.toList().cast<DatabasePokemon>();
      pokemons.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

      List<int> ids = [];
      for (var pokemon in pokemons) {
        ids.add(pokemon.id!);
      }
      return ids;
    } catch (_) {}
    return [];
  }
}
