import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerate {
  ColorGenerate._();

  static MaterialColor color(int color) {
    return MaterialColor(
      Color(color).value,
      <int, Color>{
        //shades 25%
        50: tintColor(Color(color), 0.95),
        100: tintColor(Color(color), 0.9),
        200: tintColor(Color(color), 0.75),
        300: tintColor(Color(color), 0.5),
        400: tintColor(Color(color), 0.25),
        500: Color(color),
        600: shadeColor(Color(color), 0.2),
        700: shadeColor(Color(color), 0.4),
        800: shadeColor(Color(color), 0.6),
        900: shadeColor(Color(color), 0.8),

        // ligh shades
        // 50: tintColor(Color(color), 0.874),
        // 100: tintColor(Color(color), 0.8),
        // 200: tintColor(Color(color), 0.6),
        // 300: tintColor(Color(color), 0.4),
        // 400: tintColor(Color(color), 0.2),
        // 500: Color(color),
        // 600: shadeColor(Color(color), 0.1),
        // 700: shadeColor(Color(color), 0.2),
        // 800: shadeColor(Color(color), 0.3),
        // 900: shadeColor(Color(color), 0.4),
      },
    );
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(tintValue(color.red, factor),
      tintValue(color.green, factor), tintValue(color.blue, factor), 1);

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
