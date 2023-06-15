import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/home/data/data_sources/local_data_sources/local_data_source_imp.dart';
import 'package:pokedex/src/features/home/data/repositories/repository_imp.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesInitial()) {
    on<GetFavourites>(_getFavourites);
    on<FavouritePokemon>(_addFavourite);
    on<UnfavouritePokemon>(_removeFavourite);
  }

  Future<void> _getFavourites(
      GetFavourites event, Emitter<FavouritesState> emit) async {
    Either<String, List<Pokemon>> result =
        await locator<RepositoryImp>().getSavedPokemons();
    result.fold((l) {}, (r) {
      emit(FavouritesState(pokemons: r));
    });
  }

  Future<void> _addFavourite(
      FavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (state.contains(event.pokemon)) return;
    await locator<RepositoryImp>().favourite(
      event.pokemon.id ?? -1,
    );
    Pokemon pokemon = Pokemon.clone(event.pokemon);
    emit(state.copyWith(pokemons: [...state.pokemons, pokemon]));
  }

  Future<void> _removeFavourite(
      UnfavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (!state.contains(event.pokemon)) return;
    await locator<RepositoryImp>().unFavourite(event.pokemon.id ?? -1);
    List<Pokemon> pokemons = [...state.pokemons];
    pokemons.remove(event.pokemon);
    emit(state.copyWith(pokemons: pokemons));
  }
}
