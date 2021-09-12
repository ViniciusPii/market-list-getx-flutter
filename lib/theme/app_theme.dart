import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme(this.context);

  final BuildContext context;

  final MaterialColor _primary = AppColors.neutral;
  final Color _accent = AppColors.pink[400]!;

  static const double _buttonHeight = 40;

  ThemeData get defaultTheme => ThemeData(
        primarySwatch: _primary,
        accentColor: _accent,
        primaryColor: _primary,
        primaryTextTheme: GoogleFonts.montserratTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, _buttonHeight),
          ),
        ),
      );
}
