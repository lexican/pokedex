import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/constants/pokemon_preference.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/services/api/api_service.dart';
import 'package:pokedex/src/core/services/database/database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();

    // Display pokemons stored in Hive
    List<Pokemon> pokemons = locator<DatabaseService>().getAll();
    emit(FavouritesState(pokemons: pokemons));

    DateTime pokemonLastRequestDate = DateTime.parse(
        prefs.getString(PokemonPreference.POKEMON_LAST_REQUEST_DATE) ??
            DateTime.now().toString());

    // if last pokemon request data is greater than 24 hours, fetch pokemon latest data from the api
    if (pokemonLastRequestDate.compareTo(DateTime.now()) < 0) {
      // get updated data from api
      List<Pokemon> newPokemonsList =
          await locator<ApiService>().getUpdatedPokemons();

      locator<DatabaseService>().clearDb();
      locator<DatabaseService>().addAll(newPokemonsList);

      emit(state.copyWith(pokemons: newPokemonsList));

      prefs.setString(PokemonPreference.POKEMON_LAST_REQUEST_DATE,
          DateTime.now().toString());
    }
  }

  Future<void> _addFavourite(
      FavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (state.contains(event.pokemon)) return;
    if (state.pokemons.isEmpty) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(PokemonPreference.POKEMON_LAST_REQUEST_DATE,
          DateTime.now().toString());
    }
    await locator<DatabaseService>().add(event.pokemon);
    Pokemon pokemon = Pokemon.clone(event.pokemon);
    emit(state.copyWith(pokemons: [...state.pokemons, pokemon]));
  }

  Future<void> _removeFavourite(
      UnfavouritePokemon event, Emitter<FavouritesState> emit) async {
    if (!state.contains(event.pokemon)) return;
    await locator<DatabaseService>().remove(event.pokemon);
    List<Pokemon> pokemons = [...state.pokemons];
    pokemons.remove(event.pokemon);
    emit(state.copyWith(pokemons: pokemons));
  }
}
