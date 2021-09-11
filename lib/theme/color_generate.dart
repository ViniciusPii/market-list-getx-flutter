import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerate {
  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        //shades 25%
        50: tintColor(color, 0.95),
        100: tintColor(color, 0.9),
        200: tintColor(color, 0.75),
        300: tintColor(color, 0.5),
        400: tintColor(color, 0.25),
        500: color,
        600: shadeColor(color, 0.2),
        700: shadeColor(color, 0.4),
        800: shadeColor(color, 0.6),
        900: shadeColor(color, 0.8),

        //ligh shades
        // 50: tintColor(color, 0.874),
        // 100: tintColor(color, 0.8),
        // 200: tintColor(color, 0.6),
        // 300: tintColor(color, 0.4),
        // 400: tintColor(color, 0.2),
        // 500: color,
        // 600: shadeColor(color, 0.1),
        // 700: shadeColor(color, 0.2),
        // 800: shadeColor(color, 0.3),
        // 900: shadeColor(color, 0.4),
      },
    );
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(tintValue(color.red, factor),
      tintValue(color.green, factor), tintValue(color.blue, factor), 1);

  int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(shadeValue(color.red, factor),
      shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
}
