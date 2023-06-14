import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/models/stat/stat.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source.dart';

class LocalDataSourseImp implements LocalDataSource {
  bool _databaseInitialized = false;

  @override
  Future initializeDb() async {
    if (!_databaseInitialized) {
      await _initializeDb();
    }
    Hive.registerAdapter<Pokemon>(PokemonAdapter());
    Hive.registerAdapter<Stat>(StatAdapter());

    await Hive.openBox<Pokemon>(HiveBoxName.currentPokemonBoxName);
    await Hive.openBox<Stat>(HiveBoxName.currentStatBoxName);

    _databaseInitialized = true;
  }

  Future _initializeDb() async {
    await Hive.initFlutter();
  }

  @override
  Future<void> add(Pokemon pokemon) async {
    final Box<Pokemon> currentPokemonBox =
        Hive.box(HiveBoxName.currentPokemonBoxName);
    await currentPokemonBox.add(pokemon);
  }

  @override
  Future<void> addAll(List<Pokemon> pokemons) async {
    final Box<Pokemon> currentPokemonBox =
        Hive.box(HiveBoxName.currentPokemonBoxName);
    currentPokemonBox.clear();
    await currentPokemonBox.addAll(pokemons);
  }

  @override
  Future<void> clearDb() async {
    final Box<Pokemon> currentPokemonBox =
        Hive.box(HiveBoxName.currentPokemonBoxName);
    await currentPokemonBox.clear();
  }

  @override
  Future<void> remove(Pokemon pokemon) async {
    final Box<Pokemon> currentPokemonBox =
        Hive.box(HiveBoxName.currentPokemonBoxName);
    List<Pokemon> pokemons = currentPokemonBox.values.toList();
    pokemons.remove(pokemon);
    await currentPokemonBox.clear();
    await currentPokemonBox.addAll(pokemons);
  }

  @override
  List<Pokemon> getAll() {
    final Box<Pokemon> currentPokemonBox =
        Hive.box(HiveBoxName.currentPokemonBoxName);
    return currentPokemonBox.values.toList();
  }
}
