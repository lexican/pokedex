import 'package:dio/dio.dart';
import 'package:pokedex/core/api/api_provider.dart';
import 'package:pokedex/core/models/pokemon/pokemon.dart';

class ApiService {
  final ApiProvider _apiProvider = ApiProvider();

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
}
