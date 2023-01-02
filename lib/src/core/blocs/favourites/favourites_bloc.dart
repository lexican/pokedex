import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/services/database/database_service.dart';
import 'package:pokedex/src/utils/utils.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesInitial()) {
    on<GetFavourites>(_getFavourites);
    on<FavouritePokemon>(_addFavourite);
    on<UnfavouritePokemon>(_removeFavourite);
  }

  void _getFavourites(GetFavourites event, Emitter<FavouritesState> emit) {
    List<Pokemon> pokemons = locator<DatabaseService>().getAll();
    logger.i("favourites pokemons ${pokemons.length}");
    emit(FavouritesState(pokemons: pokemons));
  }

  Future<void> _addFavourite(
      FavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (state.contains(event.pokemon)) return;
    await locator<DatabaseService>().add(event.pokemon);
    emit(state.copyWith(pokemons: [...state.pokemons, event.pokemon]));
  }

  Future<void> _removeFavourite(
      UnfavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (!state.contains(event.pokemon)) return;
    await locator<DatabaseService>().remove(event.pokemon);
    List<Pokemon> pokemons = [...state.pokemons];
    pokemons.remove(event.pokemon);
    emit(state.copyWith(pokemons: [...pokemons]));
  }
}
