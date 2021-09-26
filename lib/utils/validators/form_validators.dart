import 'package:market_list/utils/masks/text_input_masks.dart';

class FormValidators {
  static String? checkNotEmptyProductName(String? itemName) {
    if (itemName!.isEmpty) {
      return 'Informe Produto';
    }
  }

  static String? checkAmount(String? amount) {
    if (amount!.isEmpty) {
      return 'Informe uma quantidade';
    } else if (int.parse(amount) <= 0) {
      return 'Valor inválido para quantidade';
    }
  }

  static String? checkWeight(String? weight) {
    if (weight!.isEmpty) {
      return 'Informe um peso';
    } else if (TextInputMasks.unMaskWeightFormatted(weight) <= 0) {
      return 'Valor inválido para peso';
    }
  }

  static String? checkPrice(String? price) {
    if (price!.isEmpty) {
      return 'Informe o valor';
    } else if (TextInputMasks.unMaskCurrencyFormatted(price) <= 0) {
      return 'Valor não válido para um produto';
    }
  }
}
