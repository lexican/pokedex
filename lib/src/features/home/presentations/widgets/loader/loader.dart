import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
