part of 'favourites_bloc.dart';

class FavouritesState extends Equatable {
  const FavouritesState({this.pokemons = const []});
  final List<Pokemon> pokemons;

  bool contains(Pokemon pokemon) {
    return pokemons.contains(pokemon);
  }

  FavouritesState copyWith({List<Pokemon>? pokemons}) {
    return FavouritesState(pokemons: pokemons ?? this.pokemons);
  }

  @override
  List<Object> get props => [pokemons];
}

class FavouritesInitial extends FavouritesState {}
