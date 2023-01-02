import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/core/blocs/favourites/favourites_bloc.dart';
import 'package:pokedex/src/core/blocs/pokemons/pokemons_bloc.dart';
import 'package:pokedex/src/features/splash/splash.dart';

import 'src/core/constants/constants.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PokemonsBloc()..add(PokemonsFetched()),
        ),
        BlocProvider(
          create: (context) => FavouritesBloc()..add(const GetFavourites()),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
