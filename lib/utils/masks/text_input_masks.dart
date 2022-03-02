import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

class TextInputMasks {
  TextInputMasks._();

  static CurrencyTextInputFormatter currencyMask = CurrencyTextInputFormatter(
    locale: 'pt_Br',
    decimalDigits: 2,
    symbol: 'R\$',
  );

  static CurrencyTextInputFormatter weightMask = CurrencyTextInputFormatter(
    locale: 'pt_Br',
    decimalDigits: 3,
    symbol: 'Kg',
  );

  static FilteringTextInputFormatter onlyLetters = FilteringTextInputFormatter.allow(
    RegExp('[A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+|s'),
  );

  static double unMaskCurrencyFormatted(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 100;
  }

  static double unMaskWeightFormatted(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 1000;
  }
}
