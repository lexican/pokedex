// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/services/api/api_service.dart';
import 'package:pokedex/src/utils/utils.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final ApiService apiService = locator<ApiService>();
  int limit = 24;
  PokemonsBloc() : super(const PokemonsState()) {
    on<PokemonsFetched>(
      _getPokemons,
    );
  }
  Future _getPokemons(
      PokemonsFetched event, Emitter<PokemonsState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PokemonStatus.initial) {
        final List<Pokemon> pokemons = await apiService.getPokemons(
            offset: state.pokemons.length, limit: limit);

        return emit(
          state.copyWith(
            status: PokemonStatus.success,
            hasReachedMax: false,
            pokemons: pokemons,
            isLoadingMore: false,
          ),
        );
      }

      emit(
        state.copyWith(
          isLoadingMore: true,
        ),
      );

      final List<Pokemon> pokemons = await apiService.getPokemons(
          offset: state.pokemons.length, limit: limit);

      if (pokemons.isEmpty) {
        showToast("No more pokemons to load");
      }

      return emit(
        pokemons.isEmpty
            ? state.copyWith(
                hasReachedMax: true,
                isLoadingMore: false,
              )
            : state.copyWith(
                pokemons: List.of(state.pokemons)..addAll(pokemons),
                isLoadingMore: false,
                status: PokemonStatus.success,
              ),
      );
    } catch (e) {
      showToast(e.toString(), backgroundColor: Colors.red);
    }
  }
}
