part of 'pokemons_bloc.dart';

enum PokemonStatus { initial, success, failure }

class PokemonsState extends Equatable {
  const PokemonsState({
    this.status = PokemonStatus.initial,
    this.pokemons = const <Pokemon>[],
    this.hasReachedMax = false,
    this.isLoadingMore = false,
  });

  final PokemonStatus status;
  final List<Pokemon> pokemons;
  final bool hasReachedMax;
  final bool isLoadingMore;

  PokemonsState copyWith(
      {PokemonStatus? status,
      List<Pokemon>? pokemons,
      bool? hasReachedMax,
      bool? isLoadingMore}) {
    return PokemonsState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  String toString() {
    return '''PokemonsState { status: $status, hasReachedMax: $hasReachedMax, pokemons: ${pokemons.length}. isLoadingMore: $isLoadingMore }''';
  }

  @override
  List<Object> get props => [status, pokemons, hasReachedMax, isLoadingMore];
}
