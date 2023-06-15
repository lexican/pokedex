import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';

abstract class RemoteDataSource {
  Future<Either<String, List<Pokemon>>> getPokemons({int? offset, int? limit});
  Future<Either<String, List<Pokemon>>> getSavedPokemons(List<int> ids);
}
