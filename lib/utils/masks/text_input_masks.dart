import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

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

  static double unMaskCurrencyFormatted(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 100;
  }

  static double unMaskWeightFormatted(String value) {
    return double.parse(value.replaceAll(RegExp('[^0-9]'), '')) / 1000;
  }
}
