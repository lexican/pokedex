// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/home/data/repositories/repository_imp.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';
import 'package:pokedex/src/core/utils/utils.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final Repository _repository = locator<RepositoryImp>();
  int limit = 24;
  PokemonsBloc() : super(const PokemonsState()) {
    on<PokemonsFetched>(
      _getPokemons,
    );
  }
  Future _getPokemons(
      PokemonsFetched event, Emitter<PokemonsState> emit) async {
    List<Pokemon> pokemons = [];
    if (state.hasReachedMax) return;
    if (state.status == PokemonStatus.initial) {
      final result = await _repository.getPokemons(
        offset: state.pokemons.length,
        limit: limit,
      );

      result.fold((l) {
        showToast(l, backgroundColor: Colors.red);
      }, (r) {
        pokemons = r;
      });

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

    final result = await _repository.getPokemons(
        offset: state.pokemons.length, limit: limit);
    pokemons = [];

    result.fold((l) {
      showToast(l, backgroundColor: Colors.red);
    }, (r) {
      pokemons = r;
    });

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
  }
}
