import 'package:flutter/material.dart';

List<Color> pokemonImageBackgroundColors = [
  const Color(
    0xffB692F6,
  ).withOpacity(0.5),
  const Color(
    0xffFFAED7,
  ).withOpacity(0.5),
  const Color(
    0xff6CE9A6,
  ).withOpacity(0.5),
  const Color(
    0xffF65D97,
  ).withOpacity(0.5),
  Colors.black.withOpacity(0.5),
  const Color(
    0xffFFC200,
  ).withOpacity(0.5),
  const Color(
    0xff8BF9F3,
  ).withOpacity(0.5),
  const Color(
    0xffE9FC52,
  ).withOpacity(0.5),
];
List<String> pokemonImageFirstGroup = [
  "A",
  "B",
  "C",
  "D",
];
List<String> pokemonImageSecondGroup = [
  "E",
  "F",
  "G",
  "H",
];
List<String> pokemonImageThirdGroup = [
  "I",
  "J",
  "K",
];
List<String> pokemonImageFourthGroup = [
  "L",
  "M",
  "N",
];
List<String> pokemonImageFifthGroup = [
  "O",
  "P",
  "Q",
];
List<String> pokemonImageSixthGroup = [
  "R",
  "S",
  "T",
];
List<String> pokemonImageSeventhGroup = [
  "U",
  "V",
  "W",
];
List<String> pokemonImageEighthGroup = [
  "X",
  "Y",
  "Z",
];
List pokemonImageAlphabetGroup = [
  pokemonImageFirstGroup,
  pokemonImageSecondGroup,
  pokemonImageThirdGroup,
  pokemonImageFourthGroup,
  pokemonImageFifthGroup,
  pokemonImageSixthGroup,
  pokemonImageSeventhGroup,
  pokemonImageEighthGroup
];

// This method will return a color based on the {character} provided
// All the letters in the alphabet have been grouped into 7 categories and a specific color will be returned for all the characters per group
// example if character = 'S' then 'S' belongs to name FifthGroup. Which in turn will return the color at index 5 in the list (pokemonImageBackgroundColors)

Color getPokemonImageBackgroundColors(String character) {
// default to a random color
  var result = (pokemonImageBackgroundColors.toList()..shuffle()).first;
  for (List<String> element in pokemonImageAlphabetGroup) {
    if (element.contains(character.toUpperCase())) {
      result = pokemonImageBackgroundColors[
          pokemonImageAlphabetGroup.indexOf(element)];
      return result;
    }
  }
  return result;
}
