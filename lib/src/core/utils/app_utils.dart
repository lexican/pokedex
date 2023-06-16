import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/models/stat/stat.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

String convertToIdHash(num id) {
  assert(id >= 0, 'ID should be greater than or equal to 0');
  return "#${'$id'.padLeft(3, '0')}";
}

String convertPokemonTypesToString(List<String> typesList) {
  return typesList.join(', ').toString();
}

// Formula is [weight] / ([height] ^ 2)
String calculateBMI({required num height, required num weight}) {
  return (weight / (height * height)).toStringAsFixed(2);
}

// Formula is sum of stats / number of stats
int calculateAvgPower(List<Stat> stats) {
  if (stats.isEmpty) return 0;
  //Combines the sum of all the stats values
  final totalStats = stats.fold(0, (prev, val) => prev + val.value);
  //Finds the average of the stats and rounds up into an integer
  return (totalStats / stats.length).round();
}

void showToast(String message, {Color backgroundColor = Colors.black}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
