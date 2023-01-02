import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesInitial()) {
    on<GetFavourites>(_getFavourites);
    on<FavouritePokemon>(_addFavourite);
    on<UnfavouritePokemon>(_removeFavourite);
  }

  void _getFavourites(GetFavourites event, Emitter<FavouritesState> emit) {}

  Future<void> _addFavourite(
      FavouritePokemon event, Emitter<FavouritesState> emit) async {}

  Future<void> _removeFavourite(
      UnfavouritePokemon event, Emitter<FavouritesState> emit) async {}
}
