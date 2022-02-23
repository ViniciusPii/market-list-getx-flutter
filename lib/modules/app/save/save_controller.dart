import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';

class SaveController extends GetxController {
  SaveController({
    required AuthService authService,
    required ProductListRepository productListRepository,
  })  : _authService = authService,
        _productListRepository = productListRepository;

  final AuthService _authService;
  final ProductListRepository _productListRepository;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController(text: '1');

  @override
  void onClose() {
    priceEC.dispose();
    weightEC.dispose();
    productEC.dispose();
    quantityEC.dispose();
    super.onClose();
  }

  final RxBool loading = RxBool(false);
  final RxBool selected = RxBool(false);

  User? get user => _authService.user!;

  bool isSelected() {
    weightEC.clear();
    quantityEC.clear();
    return selected(!selected.value);
  }

  Future<void> saveProduct() async {
    if (form.currentState!.validate()) {
      loading.toggle();
      final String productName = productEC.text.trim();
      final double price = TextInputMasks.unMaskCurrencyFormatted(priceEC.text);
      final double weight =
          weightEC.text.isEmpty ? 0 : TextInputMasks.unMaskWeightFormatted(weightEC.text);
      final int quantity = selected.value ? 1 : int.parse(quantityEC.text);
      final double fullPrice = selected.value
          ? ProductModel.changeFullPriceWeight(price, weight)
          : ProductModel.changeFullPriceQuantity(price, quantity);
      final DateTime timestamp = DateTime.now();
      final bool isSelected = selected.value;

      await _productListRepository.save(
        user!.uid,
        ProductModel(
          productName: productName,
          price: price,
          quantity: quantity,
          fullPrice: fullPrice,
          timestamp: timestamp,
          weight: weight,
          isSelected: isSelected,
        ),
      );

      Get.back<dynamic>();
    }
  }
}
