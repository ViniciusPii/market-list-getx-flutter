import 'package:flutter/material.dart';
import 'color_generate.dart';

ColorGenerate color = ColorGenerate();

class AppColors {
  AppColors._();

  static MaterialColor aquaBlue = color.generateMaterialColor(const Color(0xff73dfc3));
  static MaterialColor aquaGreen = color.generateMaterialColor(const Color(0xff78f886));
  static MaterialColor blue = color.generateMaterialColor(const Color(0xff5979ff));
  static MaterialColor brown = color.generateMaterialColor(const Color(0xff56331c));
  static MaterialColor celeste = color.generateMaterialColor(const Color(0xff70beff));
  static MaterialColor chartreuse = color.generateMaterialColor(const Color(0xffd4f701));
  static MaterialColor crimson = color.generateMaterialColor(const Color(0xffe1153d));
  static MaterialColor green = color.generateMaterialColor(const Color(0xff4ca444));
  static MaterialColor grey = color.generateMaterialColor(const Color(0xff868686));
  static MaterialColor lime = color.generateMaterialColor(const Color(0xff75fb08));
  static MaterialColor neutral = color.generateMaterialColor(const Color(0xff7b8ba5));
  static MaterialColor orange = color.generateMaterialColor(const Color(0xffe34e18));
  static MaterialColor pink = color.generateMaterialColor(const Color(0xffe32679));
  static MaterialColor purple = color.generateMaterialColor(const Color(0xff7c4ef3));
  static MaterialColor purpleBlue = color.generateMaterialColor(const Color(0xff6a62c2));
  static MaterialColor purpleRed = color.generateMaterialColor(const Color(0xff662374));
  static MaterialColor red = color.generateMaterialColor(const Color(0xffe1262f));
  static MaterialColor violet = color.generateMaterialColor(const Color(0xff4b3ef9));
  static MaterialColor yellow = color.generateMaterialColor(const Color(0xfffff128));

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color textColor = Color(0xff383F4f);
}
