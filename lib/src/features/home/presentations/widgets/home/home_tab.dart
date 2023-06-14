import 'package:flutter/material.dart';
import 'package:pokedex/src/features/home/presentations/widgets/pokemon_text/pokemon_text.dart';

class HomeTab extends StatelessWidget {
  final int tabIndex;
  final int currentTabIndex;
  final bool isFavourite;
  final Function onTap;
  final String tabLabel;
  final int favouritesCount;
  const HomeTab({
    super.key,
    required this.tabIndex,
    required this.currentTabIndex,
    this.isFavourite = false,
    required this.onTap,
    required this.tabLabel,
    this.favouritesCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(tabIndex);
        },
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PokemanText.h1(
                      content: tabLabel,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: currentTabIndex == tabIndex
                          ? Theme.of(context).textTheme.headline1?.color
                          : Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    if (isFavourite)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: PokemanText.b1(
                              content: favouritesCount.toString(),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (currentTabIndex == tabIndex)
              Container(
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFF3558CD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
