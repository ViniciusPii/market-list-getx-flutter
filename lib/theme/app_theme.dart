import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme(this.context);

  final BuildContext context;

  final MaterialColor _primary = AppColors.neutral;
  final Color _accent = AppColors.pink[400]!;

  static const double _buttonHeight = 45;

  ThemeData get defaultTheme => ThemeData(
        primaryTextTheme: GoogleFonts.montserratTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, _buttonHeight),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.pink[400],
          selectionColor: AppColors.pink[200],
          selectionHandleColor: AppColors.pink[400],
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: _primary).copyWith(
          secondary: _accent,
        ),
      );
}
