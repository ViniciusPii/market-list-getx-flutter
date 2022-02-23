import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/theme/app_dimension.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const double _buttonHeight = AppDimension.dm_40;

  static ThemeData get defaultTheme => ThemeData(
        primaryColor: AppColors.appPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryTextTheme: GoogleFonts.montserratTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
              double.infinity,
              _buttonHeight,
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.appPrimary,
          secondary: AppColors.appSecondary, // Your accent color
        ),
      );
}
