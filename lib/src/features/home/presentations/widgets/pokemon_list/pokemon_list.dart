import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/blocs/pokemons/pokemons_bloc.dart';
import 'package:pokedex/src/features/home/presentations/widgets/loader/loader.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_item/pokemon_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        if (state.status == PokemonStatus.initial) {
          return const Loader();
        }
        if (state.status == PokemonStatus.success) {
          if (state.pokemons.isEmpty) {
            return const Center(child: Text('No pokemons'));
          }
          return Padding(
            padding: const EdgeInsets.all(12),
            child: CustomScrollView(
              slivers: [
                SliverGrid(
                  key: const PageStorageKey<String>('listview'),
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
                      if (index == state.pokemons.length - 3 &&
                          !state.isLoadingMore &&
                          !state.hasReachedMax) {
                        context.read<PokemonsBloc>().add(PokemonsFetched());
                      }
                      return PokemonItem(pokemon: state.pokemons[index]);
                    },
                    childCount: state.pokemons.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 12),
                ),
                if (state.isLoadingMore)
                  const SliverToBoxAdapter(
                    child: Loader(),
                  ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
