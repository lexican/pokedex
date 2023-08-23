import 'package:flutter/material.dart';
import 'package:pokedex/src/core/utils/app_utils.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_text/pokemon_text.dart';

class BodyInfo extends StatelessWidget {
  final Pokemon pokemon;
  const BodyInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _InfoSection(title: 'Height', value: pokemon.height.toString()),
            _InfoSection(title: 'Weight', value: pokemon.weight.toString()),
            _InfoSection(
              title: 'BMI',
              value: calculateBMI(
                height: pokemon.height ?? 0,
                weight: pokemon.weight ?? 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemanText.b1(
            content: title,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 4,
          ),
          PokemanText.h1(
            content: value,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
