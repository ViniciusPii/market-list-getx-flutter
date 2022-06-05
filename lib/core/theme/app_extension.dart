import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppExtension {
  AppExtension._();

  //Colors
  static const Color primary = AppColors.pink400;
  static const Color primaryDark = AppColors.pink800;
  static const Color primaryLight = AppColors.pink200;
  static const Color secondary = AppColors.pink100;
  static const Color background = AppColors.celeste200;

  //Text Color
  static const Color textColor = AppColors.neutral800;
  static const Color textLightColor = AppColors.neutral600;

  //Font
  static String? fontFamily = GoogleFonts.montserrat().fontFamily;
}
