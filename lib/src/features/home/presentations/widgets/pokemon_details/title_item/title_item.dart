import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/src/core/utils/utils.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_image/pokemon_image.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_text/pokemon_text.dart';

class TitleItem extends StatelessWidget {
  final Pokemon pokemon;
  const TitleItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 23, bottom: 14),
        decoration: BoxDecoration(
          color: getPokemonImageBackgroundColors(
              pokemon.name.toString().characters.first),
        ),
        height: 250.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PokemanText.h1(
                    content: pokemon.name.toString().capitalize(),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  PokemanText.h1(
                    content: convertPokemonTypesToString(
                      pokemon.types ?? [],
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  PokemanText.h1(
                    content: convertToIdHash(pokemon.id ?? 0),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 152,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Assets.icons.pokemonBackground.svg(
                      height: 176,
                      width: 176,
                      color: getPokemonImageBackgroundColors(
                          pokemon.name.toString().characters.first),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Hero(
                      tag: 'image-${pokemon.id}',
                      child: PokemonImage(
                        imageUrl: pokemon.imageUrl ?? '',
                        imageHeight: 125,
                        imageWidth: 136,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
