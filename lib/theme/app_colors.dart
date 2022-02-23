import 'package:flutter/material.dart';
import 'color_generate.dart';

ColorGenerate color = ColorGenerate();

class AppColors {
  AppColors._();

  //AppColors
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  static Color textLightColor = neutral.shade600;
  static const Color textColor = Color(0xff383F4f);

  //AppBaseColors
  static final MaterialColor appPrimary = color.generateMaterialColor(pink.shade400.value);
  static final MaterialColor appSecondary = color.generateMaterialColor(pink.shade200.value);
  static final MaterialColor appBackground = color.generateMaterialColor(celeste.shade200.value);

  //Extensions
  static Color primary = appPrimary;
  static Color primaryDark = appPrimary.shade700;
  static Color primaryLight = appPrimary.shade200;
  static Color secondary = appSecondary;
  static Color background = appBackground;

  //BaseColors
  static MaterialColor aquaBlue = color.generateMaterialColor(0xff73dfc3);
  static MaterialColor aquaGreen = color.generateMaterialColor(0xff78f886);
  static MaterialColor blue = color.generateMaterialColor(0xff5979ff);
  static MaterialColor brown = color.generateMaterialColor(0xff56331c);
  static MaterialColor celeste = color.generateMaterialColor(0xff70beff);
  static MaterialColor chartreuse = color.generateMaterialColor(0xffd4f701);
  static MaterialColor crimson = color.generateMaterialColor(0xffe1153d);
  static MaterialColor green = color.generateMaterialColor(0xff4ca444);
  static MaterialColor grey = color.generateMaterialColor(0xff868686);
  static MaterialColor lime = color.generateMaterialColor(0xff75fb08);
  static MaterialColor neutral = color.generateMaterialColor(0xff7b8ba5);
  static MaterialColor orange = color.generateMaterialColor(0xffe34e18);
  static MaterialColor pink = color.generateMaterialColor(0xffe32679);
  static MaterialColor purple = color.generateMaterialColor(0xff7c4ef3);
  static MaterialColor purpleBlue = color.generateMaterialColor(0xff6a62c2);
  static MaterialColor purpleRed = color.generateMaterialColor(0xff662374);
  static MaterialColor red = color.generateMaterialColor(0xffe1262f);
  static MaterialColor violet = color.generateMaterialColor(0xff4b3ef9);
  static MaterialColor yellow = color.generateMaterialColor(0xfffff128);
}
