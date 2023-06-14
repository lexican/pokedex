// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'database_pokemon.g.dart';

@HiveType(typeId: 0)
class DatabasePokemon extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? imageUrl;

  DatabasePokemon({
    this.id,
    this.name,
    this.imageUrl,
  });

  DatabasePokemon.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['sprites']['other']['official-artwork']['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  factory DatabasePokemon.clone(DatabasePokemon source) {
    return DatabasePokemon(
      id: source.id,
      name: source.name,
      imageUrl: source.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
