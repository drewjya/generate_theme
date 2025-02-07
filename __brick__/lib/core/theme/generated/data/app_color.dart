import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  {{#colors}}
  static const Color {{name}} = Color({{value}});
  {{/colors}}

  static List<Color> generateColor({int count = 10}) {
    List<Color> colors = [];
    Random random = Random();

    for (int i = 0; i < count; i++) {
      double hue = (i * (360 / count) + random.nextDouble() * 30) %
          360; // Ensure diverse hues
      double saturation = random.nextDouble() * 0.4 + 0.6; // Keep colors vivid
      double lightness =
          random.nextDouble() * 0.3 + 0.5; // Keep brightness moderate

      colors.add(HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor());
    }

    return colors;
  }
}

