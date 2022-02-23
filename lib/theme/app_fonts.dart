import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
  AppFonts._();

  static const Color _colorDefault = AppColors.textColor;

  static const FontWeight _normal = FontWeight.normal;
  static const FontWeight _medium = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  static const double _dimension1 = 12;
  static const double _dimension2 = 14;
  static const double _dimension3 = 16;
  static const double _dimension4 = 18;
  static const double _dimension5 = 20;
  static const double _dimension6 = 22;
  static const double _dimension7 = 24;
  static const double _dimension8 = 26;
  static const double _dimension9 = 28;
  static const double _dimension10 = 30;

  static TextStyle _fontFamily({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  //Size 1
  static TextStyle size_1({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension1,
    );
  }

  static TextStyle sizeMedium_1({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension1,
    );
  }

  static TextStyle sizeBold_1({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension1,
    );
  }

  //Size 2
  static TextStyle size_2({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension2,
    );
  }

  static TextStyle sizeMedium_2({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension2,
    );
  }

  static TextStyle sizeBold_2({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension2,
    );
  }

  //Size 3
  static TextStyle size_3({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension3,
    );
  }

  static TextStyle sizeMedium_3({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension3,
    );
  }

  static TextStyle sizeBold_3({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension3,
    );
  }

  //Size 4
  static TextStyle size_4({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension4,
    );
  }

  static TextStyle sizeMedium_4({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension4,
    );
  }

  static TextStyle sizeBold_4({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension4,
    );
  }

  //Size 5
  static TextStyle size_5({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension5,
    );
  }

  static TextStyle sizeMedium_5({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension5,
    );
  }

  static TextStyle sizeBold_5({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension5,
    );
  }

  //Size 6
  static TextStyle size_6({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension6,
    );
  }

  static TextStyle sizeMedium_6({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension6,
    );
  }

  static TextStyle sizeBold_6({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension6,
    );
  }

  //Size 7
  static TextStyle size_7({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension7,
    );
  }

  static TextStyle sizeMedium_7({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension7,
    );
  }

  static TextStyle sizeBold_7({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension7,
    );
  }

  //Size 8
  static TextStyle size_8({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension8,
    );
  }

  static TextStyle sizeMedium_8({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension8,
    );
  }

  static TextStyle sizeBold_8({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension8,
    );
  }

  //Size 9
  static TextStyle size_9({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension9,
    );
  }

  static TextStyle sizeMedium_9({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension9,
    );
  }

  static TextStyle sizeBold_9({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension9,
    );
  }

  //Size 10
  static TextStyle size_10({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _normal,
      fontSize: _dimension10,
    );
  }

  static TextStyle sizeMedium_10({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _medium,
      fontSize: _dimension10,
    );
  }

  static TextStyle sizeBold_10({
    Color? color = _colorDefault,
  }) {
    return _fontFamily(
      color: color,
      fontWeight: _bold,
      fontSize: _dimension10,
    );
  }
}
