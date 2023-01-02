import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/app_colors.dart';
import 'package:pokedex/src/utils/string_utils.dart';

class StatItem extends StatelessWidget {
  final String title;
  final int statValue;
  const StatItem({super.key, required this.title, required this.statValue});

  @override
  Widget build(BuildContext context) {
    final double value = (statValue * 0.01).clamp(0, 1);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '${title.capitalizeAllWordsSepByDash()} ',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B6B6B),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: '$statValue ',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF161A33),
                      fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: Colors.transparent,
              thumbShape: SliderComponentShape.noThumb,
              overlayShape: SliderComponentShape.noOverlay,
              disabledActiveTrackColor: () {
                if (value >= 0.67) return darkGreen;
                if (value > 0.33) return darkYellow;
                return darkPink;
              }(),
            ),
            child: Slider(value: value.toDouble(), onChanged: null),
          ),
        ],
      ),
    );
  }
}
