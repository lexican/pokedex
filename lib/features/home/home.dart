import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemon_app_bar/pokemon_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PokemonAppBar()

    );
  }
}
