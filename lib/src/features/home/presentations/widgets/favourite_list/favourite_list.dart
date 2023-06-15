import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home/presentations/blocs/favourites/favourites_bloc.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_item/pokemon_item.dart';

class FavouriteList extends StatelessWidget {
  const FavouriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        if (state.pokemons.isEmpty) {
          return const Center(child: Text('No pokemons'));
        }
        return Padding(
          padding: const EdgeInsets.all(12),
          child: CustomScrollView(
            slivers: [
              SliverGrid(
                key: const PageStorageKey<String>('listview2'),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 4),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 170,
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return PokemonItem(pokemon: state.pokemons[index]);
                  },
                  childCount: state.pokemons.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
