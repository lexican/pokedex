import 'package:flutter/material.dart';
import 'package:pokedex/gen/assets.gen.dart';
import 'package:pokedex/widgets/pokemon_text/pokemon_text.dart';

class PokemonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.logo.svg(width: 24, height: 24),
            const SizedBox(
              width: 8,
            ),
            const PokemanText.h1(
              content: "Pokedex",
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
