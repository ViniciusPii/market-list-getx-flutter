import 'package:market_list/core/utils/masks/text_input_masks.dart';

mixin FormValidators {
  static String? checkNotEmptyProductName(String? itemName) {
    if (itemName!.isEmpty) {
      return 'Informe Produto';
    }
    return null;
  }

  static String? checkAmount(String? amount) {
    if (amount!.isEmpty) {
      return 'Informe uma quantidade';
    } else if (int.parse(amount) <= 0) {
      return 'Valor inválido para quantidade';
    }
    return null;
  }

  static String? checkWeight(String? weight) {
    if (weight!.isEmpty) {
      return 'Informe um peso';
    } else if (TextInputMasks.unMaskWeightFormatted(weight) <= 0) {
      return 'Valor inválido para peso';
    }
    return null;
  }

  static String? checkPrice(String? price) {
    if (price!.isEmpty) {
      return 'Informe o valor';
    } else if (TextInputMasks.unMaskCurrencyFormatted(price) <= 0) {
      return 'Valor não válido para um produto';
    }
    return null;
  }
}
