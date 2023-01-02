import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/services/database/database_service.dart';

Future<void> main() async {
  setupLocator();
  await locator<DatabaseService>().initializeDb();
  runApp(const App());
}
