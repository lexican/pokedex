import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/utils/utils.dart';

void main() {
  test(
    "Should return a color based on pokemon's name first letter",
    () {
      expect(
        getPokemonImageBackgroundColors('A'),
        equals(
          const Color(
            0xffb692F6,
          ).withOpacity(0.5),
        ),
      );
    },
  );
}
