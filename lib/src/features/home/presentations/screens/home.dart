import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/src/features/home/presentations/blocs/favourites/favourites_bloc.dart';

import '../widgets/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageViewController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _pageViewController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController?.dispose();
    super.dispose();
  }

  void _changePage(int pageNum) {
    setState(() {
      _currentTabIndex = pageNum;
      _pageViewController?.animateToPage(
        pageNum,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PokemonAppBar(),
      body: DefaultTabController(
        length: 2,
        child: Container(
          color: const Color(0xFFE8E8E8),
          child: Column(
            children: [
              Container(
                height: 52,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeTab(
                      currentTabIndex: _currentTabIndex,
                      tabIndex: 0,
                      onTap: _changePage,
                      tabLabel: 'All Pokemons',
                    ),
                    BlocBuilder<FavouritesBloc, FavouritesState>(
                      builder: (context, state) {
                        return HomeTab(
                          currentTabIndex: _currentTabIndex,
                          tabIndex: 1,
                          onTap: _changePage,
                          tabLabel: 'Favourites',
                          isFavourite: true,
                          favouritesCount: state.pokemons.length,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageViewController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentTabIndex = value;
                    });
                  },
                  children: const [
                    PokemonList(),
                    FavouriteList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
