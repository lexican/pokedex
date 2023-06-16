import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/src/core/api/api_client.dart';
import 'package:pokedex/src/core/api/exceptions/network_exceptions.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiClient _apiClient = locator<ApiClient>();

  @override
  Future<Either<String, List<Pokemon>>> getPokemons(
      {int? offset, int? limit}) async {
    List<Pokemon> pokemons = [];
    try {
      final response = await _apiClient.get(
        ApiConfig.pokemonsPath,
        parameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      dynamic data = response.data['results'];
      for (var e in data) {
        Response response = await _apiClient.get(e['url']);
        dynamic map = response.data;
        Pokemon poke = Pokemon.fromJson(map);
        pokemons.add(poke);
      }
      return Right(pokemons);
    } catch (e) {
      return Left(NetworkExceptions.fromDioError(e as DioError).toString());
    }
  }

  @override
  Future<Either<String, List<Pokemon>>> getSavedPokemons(List<int> ids) async {
    List<Pokemon> pokemons = [];
    try {
      for (var id in ids) {
        Response response =
            await _apiClient.get("${ApiConfig.pokemonsPath}/$id");
        dynamic map = response.data;
        Pokemon poke = Pokemon.fromJson(map);
        pokemons.add(poke);
      }
      return Right(pokemons);
    } catch (e) {
      return Left(NetworkExceptions.fromDioError(e as DioError).toString());
    }
  }
}
