import 'package:flutter/material.dart';

class PokemanText extends StatelessWidget {
  final String? content;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Style textStyle;
  final Color? color;
  final double? letterSpacing;

  const PokemanText.h1(
      {super.key,
      this.content,
      this.fontWeight,
      this.fontSize,
      this.textStyle = Style.h1,
      this.color,
      this.letterSpacing});

  const PokemanText.b1(
      {super.key,
      this.content,
      this.fontWeight,
      this.fontSize,
      this.textStyle = Style.b1,
      this.color,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? "",
      style: _getStyle(textStyle, context)!.copyWith(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

enum Style { h1, b1 }

TextStyle? _getStyle(Style textStyle, BuildContext context) {
  switch (textStyle) {
    case Style.h1:
      {
        return Theme.of(context).textTheme.headline1;
      }
    case Style.b1:
      {
        return Theme.of(context).textTheme.bodyText1;
      }
  }
}
