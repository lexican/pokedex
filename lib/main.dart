import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/core/locator/locator.dart';

void main() {
  setupLocator();
  runApp(const App());
}
