import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/models/stat/stat.dart';
import 'package:pokedex/src/core/utils/utils.dart';

void main() {
  group('App utils functions tests', () {
    test(
      "Should calculate the average power of a pokemon",
      () {
        const stats = [
          Stat(title: 'Hp', value: 45),
          Stat(title: 'Attack', value: 49),
          Stat(title: 'Defence', value: 49),
          Stat(title: 'Special Attack', value: 65),
          Stat(title: 'Special Defense', value: 65),
          Stat(title: 'Speed', value: 45),
        ];
        final result = calculateAvgPower(stats);

        expect(result, equals(53));
      },
    );
    test(
      "Should calculate the bmi of a pokemon",
      () {
        String result = calculateBMI(height: 7, weight: 69);
        expect(result, equals((69 / (7 * 7)).toStringAsFixed(2).toString()));
      },
    );
    test(
      "Should convert a number to a string prefixed with '#' and leading '0's",
      () {
        expect(convertToIdHash(1), equals('#001'));

        expect(convertToIdHash(100), equals('#100'));

        expect(() => convertToIdHash(-1), equals(throwsAssertionError));
      },
    );

    test(
      "Should convert pokemon types list to string",
      () {
        List<String> types = ["grass", "poison"];
        expect(
            () => convertPokemonTypesToString(types), equals("grass, poison"));
      },
    );
  });
}
