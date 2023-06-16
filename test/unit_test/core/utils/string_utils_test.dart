import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/utils/utils.dart';

void main() {
  group(
    'String utils functions tests',
    () {
      test(
        "Should convert a list of strings to a comma seperated string",
        () {
          List<String> types = ['Grass, Poison'];
          expect(convertPokemonTypesToString(types), equals("Grass, Poison"));
        },
      );
      test(
        "Should capitalise first letter in a string",
        () {
          expect("poison".capitalize(), equals("Poison"));
        },
      );
      test(
        "Should capitalise first letter in a string separated by '-",
        () {
          expect("special-attack".capitalizeAllWordsSepByDash(),
              equals("Special Attack"));
        },
      );
    },
  );
}
