import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/src/core/locator/locator.dart';

import 'src/features/home/data/data_sources/local_data_sources/local_data_source_imp.dart';

Future<void> main() async {
  setupLocator();
  await locator<LocalDataSourceImp>().initializeDb();
  runApp(const App());
}
