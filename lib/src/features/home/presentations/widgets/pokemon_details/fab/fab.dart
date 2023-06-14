import 'package:flutter/material.dart';

class FavFab extends StatelessWidget {
  final bool favourited;
  final void Function() onPressed;
  const FavFab({super.key, required this.favourited, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      extendedTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      label: Text(
        favourited ? 'Remove from favourites' : 'Mark as favourite',
      ),
      backgroundColor: Color.lerp(
        Theme.of(context).primaryColor,
        Colors.white,
        favourited ? 0.8 : 0,
      ),
      foregroundColor:
          favourited ? Theme.of(context).primaryColor : Colors.white,
      onPressed: onPressed,
    );
  }
}
