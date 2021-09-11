import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  AppFonts._();

  static const Color _colorDefault = AppColors.textColor;
  static const FontWeight _weightDefault = FontWeight.normal;

  static TextStyle _fontFamily({
    Color? color,
    FontWeight? weight,
    double? size,
  }) {
    return GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextStyle size_1({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 12,
    );
  }

  static TextStyle size_2({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 14,
    );
  }

  static TextStyle size_3({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 16,
    );
  }

  static TextStyle size_4({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 18,
    );
  }

  static TextStyle size_5({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 20,
    );
  }

  static TextStyle size_6({
    Color? color = _colorDefault,
    FontWeight? weight,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 22,
    );
  }

  static TextStyle size_7({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 24,
    );
  }

  static TextStyle size_8({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 26,
    );
  }

  static TextStyle size_9({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 28,
    );
  }

  static TextStyle size_10({
    Color? color = _colorDefault,
    FontWeight? weight = _weightDefault,
  }) {
    return _fontFamily(
      color: color,
      weight: weight,
      size: 30,
    );
  }
}
