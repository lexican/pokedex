import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/presentations/blocs/favourites/favourites_bloc.dart';
import 'package:pokedex/src/core/utils/utils.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_details/body_info/body_info.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_details/fab/fab.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_details/stat_item/stat_item.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_details/title_item/title_item.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_text/pokemon_text.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetails({super.key, required this.pokemon});

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  late bool isFavourited;
  late final Pokemon pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = widget.pokemon;
  }

  void _changeFavouriteState() {
    if (isFavourited) {
      context.read<FavouritesBloc>().add(UnfavouritePokemon(widget.pokemon));
      setState(() => isFavourited = false);
    } else {
      context.read<FavouritesBloc>().add(FavouritePokemon(widget.pokemon));
      setState(() => isFavourited = true);
    }
  }

  @override
  void didChangeDependencies() {
    isFavourited =
        context.read<FavouritesBloc>().state.contains(widget.pokemon);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FavFab(
        favourited: isFavourited,
        onPressed: _changeFavouriteState,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 1,
            backgroundColor: getPokemonImageBackgroundColors(
                widget.pokemon.name.toString().characters.first),
            foregroundColor: const Color(0xff161A33),
            leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFF3F9EF),
            ),
          ),
          TitleItem(
            pokemon: widget.pokemon,
          ),
          BodyInfo(
            pokemon: widget.pokemon,
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 8,
              thickness: 1,
              color: Color(0xFFF3F9EF),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const PokemanText.h1(
                    content: 'Base stats',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ...widget.pokemon.stats!.map(
                  (poke) {
                    return StatItem(
                      title: poke.title,
                      statValue: poke.value,
                    );
                  },
                ).toList()
                  ..add(
                    StatItem(
                      title: 'Avg. Power',
                      statValue: calculateAvgPower(widget.pokemon.stats ?? []),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
