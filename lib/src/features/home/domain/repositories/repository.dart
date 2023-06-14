import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';

abstract class Repository {
  Future<Either<String, List<Pokemon>>> getPokemons({int? offset, int? limit});
}
