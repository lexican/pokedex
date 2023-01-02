import 'package:flutter/material.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/pokemon_details/pokemon_details.dart';
import 'package:pokedex/src/utils/utils.dart';
import 'package:pokedex/src/widgets/pokemon_image/pokemon_image.dart';
import 'package:pokedex/src/widgets/pokemon_text/pokemon_text.dart';

class PokemonItem extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetails(
              pokemon: pokemon,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              color: getPokemonImageBackgroundColors(
                  pokemon.name.toString().characters.first),
              child: PokemonImage(
                imageHeight: 104,
                imageWidth: double.infinity,
                imageUrl: pokemon.imageUrl ?? '',
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 9,
                right: 9,
                top: 9,
                bottom: 10,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PokemanText.b1(
                    content: convertToIdHash(pokemon.id ?? 0),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  PokemanText.b1(
                    content: pokemon.name.toString().capitalize(),
                    color: Colors.black.withOpacity(0.87),
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PokemanText.b1(
                    content: convertPokemonTypesToString(
                      pokemon.types ?? [],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
