import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonImage extends StatelessWidget {
  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  const PokemonImage({
    super.key,
    required this.imageUrl,
    this.imageWidth,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: imageHeight,
      width: imageWidth,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
          color: Theme.of(context).primaryColor,
        ),
      ),
      imageUrl: imageUrl,
    );
  }
}
