// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'database_pokemon.g.dart';

@HiveType(typeId: 0)
class DatabasePokemon extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  DateTime? createdAt;

  DatabasePokemon({this.id, this.createdAt});

  @override
  List<Object?> get props => [id, createdAt];
}
