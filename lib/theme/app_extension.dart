import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/theme/app_colors.dart';

import 'color_generate.dart';

class AppExtension {
  AppExtension._();

  //Colors
  static MaterialColor primary = ColorGenerate.color(AppColors.pink.shade400.value);
  static Color primaryDark = ColorGenerate.color(primary.shade800.value);
  static Color primaryLight = ColorGenerate.color(primary.shade200.value);
  static Color secondary = ColorGenerate.color(primary.shade200.value);
  static Color background = ColorGenerate.color(AppColors.celeste.shade200.value);

  //Text Color
  static Color textColor = AppColors.neutral.shade800;
  static Color textLightColor = AppColors.neutral.shade500;

  //Font
  static String? fontFamily = GoogleFonts.montserrat().fontFamily;
}
