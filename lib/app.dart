import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/font_family.dart';
import 'package:pokedex/features/splash/splash.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primaryColor: const Color(0xFF3558CD),
        fontFamily: FontFamily.notoSans,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24,
            color: Color(0xFF161A33),
            fontWeight: FontWeight.w700,
          ),
          bodyText1: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B6B6B),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const Splash(),
    );
  }
}