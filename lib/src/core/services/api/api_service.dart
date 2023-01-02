import 'package:dio/dio.dart';
import 'package:pokedex/src/core/api/api_provider.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/services/database/database_service.dart';

class ApiService {
  final ApiProvider _apiProvider = locator<ApiProvider>();

  Future<List<Pokemon>> getPokemons({int? offset, int? limit}) async {
    List<Pokemon> pokemons = [];
    try {
      Response response = await _apiProvider.getPokemons(
          path: '/pokemon', offset: offset, limit: limit);

      dynamic data = response.data['results'];

      for (var v in data) {
        Response response = await _apiProvider.getPokemon(path: v['url']);
        dynamic map = response.data;
        Pokemon poke = Pokemon.fromJson(map);
        pokemons.add(poke);
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Pokemon>> getUpdatedPokemons() async {
    List<Pokemon> pokemons = locator<DatabaseService>().getAll();
    List<Pokemon> newPokemonsList = [];

    try {
      for (var pokemon in pokemons) {
        Response response = await locator<ApiProvider>()
            .getPokemon(path: "$baseUrl/pokemon/${pokemon.id}/");
        dynamic map = response.data;
        Pokemon poke = Pokemon.fromJson(map);
        newPokemonsList.add(poke);
      }

      return newPokemonsList;
    } catch (e) {
      rethrow;
    }
  }
}
