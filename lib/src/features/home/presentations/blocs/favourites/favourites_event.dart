part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class GetFavourites extends FavouritesEvent {
  const GetFavourites();
}

class FavouritePokemon extends FavouritesEvent {
  final Pokemon pokemon;

  const FavouritePokemon(this.pokemon);
}

class UnfavouritePokemon extends FavouritesEvent {
  final Pokemon pokemon;

  const UnfavouritePokemon(this.pokemon);
}
