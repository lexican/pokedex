import 'package:equatable/equatable.dart';
import 'package:pokedex/src/core/models/stat/stat.dart';
import 'package:pokedex/src/utils/string_utils.dart';


class Pokemon extends Equatable {
  int? id;
  String? name;
  String? imageUrl;
  int? height;
  int? weight;
  List<String>? types;
  List<Stat>? stats;

  Pokemon({
    this.id,
    this.name,
    this.imageUrl,
    this.height,
    this.weight,
    this.types,
    this.stats,
  });

  Pokemon.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['sprites']['other']['official-artwork']['front_default'];
    height = json['height'];
    weight = json['weight'];
    types = (json['types'] as List).map<String>((e) {
      return e['type']['name'].toString().capitalize();
    }).toList();
    stats = (json['stats'] as List).map((e) {
      return Stat(title: e['stat']['name'], value: e['base_stat']);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['height'] = height;
    data['weight'] = weight;
    data['types'] = types;
    data['stat'] = stats;
    return data;
  }

  factory Pokemon.clone(Pokemon source) {
    return Pokemon(
        id: source.id,
        name: source.name,
        imageUrl: source.imageUrl,
        height: source.height,
        weight: source.weight,
        types: source.types,
        stats: source.stats);
  }

  @override
  List<Object?> get props => [id, name];
}
