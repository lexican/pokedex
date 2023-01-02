import 'package:flutter/material.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/utils/utils.dart';
import 'package:pokedex/src/widgets/pokemon_details/body_info/body_info.dart';
import 'package:pokedex/src/widgets/pokemon_details/stat_item/stat_item.dart';
import 'package:pokedex/src/widgets/pokemon_details/title_item/title_item.dart';
import 'package:pokedex/src/widgets/pokemon_text/pokemon_text.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 1,
            backgroundColor: getPokemonImageBackgroundColors(
                pokemon.name.toString().characters.first),
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
            pokemon: pokemon,
          ),
          BodyInfo(
            pokemon: pokemon,
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
                ...pokemon.stats!.map(
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
                      statValue: calculateAvgPower(pokemon.stats ?? []),
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
