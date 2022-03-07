import 'dart:developer';

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

  final ProductModel? _product = Get.arguments as ProductModel?;

  final RxBool _loader = RxBool(false);
  final RxBool _selected = RxBool(false);

  final FocusNode focus = FocusNode();

  bool get loader => _loader.value;
  User? get user => _authService.user!;
  bool get selected => _selected.value;
  ProductModel? get product => _product;

  @override
  void onInit() {
    super.onInit();
    if (_product != null) {
      productEC.text = product!.productName;
      quantityEC.text = product!.quantity.toString();
      weightEC.text = ProductModel.formatWeight(product!.weight);
      priceEC.text = ProductModel.formatCurrency(product!.price);
    }
  }

  @override
  void onClose() {
    super.onClose();
    priceEC.dispose();
    weightEC.dispose();
    productEC.dispose();
    quantityEC.dispose();
  }

  bool isSelected() {
    weightEC.clear();
    quantityEC.clear();
    focus.requestFocus();
    return _selected(!_selected.value);
  }

  Future<void> saveProduct() async {
    try {
      if (form.currentState!.validate()) {
        _loader.toggle();
        final String productName = productEC.text.trim();
        final double price = TextInputMasks.unMaskCurrencyFormatted(priceEC.text);
        final double weight =
            weightEC.text.isEmpty ? 0 : TextInputMasks.unMaskWeightFormatted(weightEC.text);
        final int quantity = _selected.value ? 1 : int.parse(quantityEC.text);
        final double fullPrice = _selected.value || (_product != null && _product!.isSelected)
            ? ProductModel.changeFullPriceWeight(price, weight)
            : ProductModel.changeFullPriceQuantity(price, quantity);
        final DateTime timestamp = DateTime.now();
        final bool isSelected = _selected.value;

        if (_product != null) {
          await _productService.update(
            user!.uid,
            ProductModel(
              id: _product!.id,
              productName: productName,
              price: price,
              quantity: quantity,
              fullPrice: fullPrice,
              timestamp: timestamp,
              weight: weight,
              isSelected: _product!.isSelected,
            ),
          );

          Get.back<dynamic>();
        } else {
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
    } catch (e) {
      log(e.toString());
      Get.back<dynamic>();
    }
  }
}
