import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/auth/auth_service.dart';
import 'package:market_list/core/utils/masks/text_input_masks.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/services/product/product_service.dart';

class SaveController extends GetxController {
  SaveController({
    required AuthService authService,
    required ProductService productService,
  })  : _authService = authService,
        _productService = productService;

  final AuthService _authService;
  final ProductService _productService;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController(text: '1');

  final RxBool _loading = RxBool(false);
  final RxBool _selected = RxBool(false);

  bool get loading => _loading.value;
  User? get user => _authService.user!;
  bool get selected => _selected.value;

  @override
  void onClose() {
    priceEC.dispose();
    weightEC.dispose();
    productEC.dispose();
    quantityEC.dispose();
    super.onClose();
  }

  bool isSelected() {
    weightEC.clear();
    quantityEC.clear();
    return _selected(!_selected.value);
  }

  Future<void> saveProduct() async {
    if (form.currentState!.validate()) {
      _loading.toggle();
      final String productName = productEC.text.trim();
      final double price = TextInputMasks.unMaskCurrencyFormatted(priceEC.text);
      final double weight =
          weightEC.text.isEmpty ? 0 : TextInputMasks.unMaskWeightFormatted(weightEC.text);
      final int quantity = _selected.value ? 1 : int.parse(quantityEC.text);
      final double fullPrice = _selected.value
          ? ProductModel.changeFullPriceWeight(price, weight)
          : ProductModel.changeFullPriceQuantity(price, quantity);
      final DateTime timestamp = DateTime.now();
      final bool isSelected = _selected.value;

      await _productService.save(
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
