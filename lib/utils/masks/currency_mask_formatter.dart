import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    final double value = double.parse(newValue.text);

    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_Br', decimalDigits: 2);

    final String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText, selection: TextSelection.collapsed(offset: newText.length));
  }

  static double unMaskFormatted(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 100;
  }
}
