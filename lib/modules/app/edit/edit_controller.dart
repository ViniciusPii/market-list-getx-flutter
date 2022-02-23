import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';

class EditController extends GetxController {
  EditController({
    required AuthService authService,
    required ProductListRepository productListRepository,
  })  : _authService = authService,
        _productListRepository = productListRepository;

  final AuthService _authService;
  final ProductListRepository _productListRepository;

  final ProductModel _product = Get.arguments as ProductModel;

  User? get user => _authService.user!;
  ProductModel get product => _product;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    productEC.text = _product.productName;
    quantityEC.text = _product.quantity.toString();
    priceEC.text = ProductModel.formatCurrency(_product.price);
    weightEC.text = ProductModel.formatWeight(_product.weight);
  }

  @override
  void onClose() {
    priceEC.dispose();
    weightEC.dispose();
    productEC.dispose();
    quantityEC.dispose();
    super.onClose();
  }

  final RxBool loading = RxBool(false);

  Future<void> editProduct() async {
    if (form.currentState!.validate()) {
      loading.toggle();
      final String id = _product.id;
      final String productName = productEC.text.trim();
      final double price = TextInputMasks.unMaskCurrencyFormatted(priceEC.text);
      final double weight =
          weightEC.text.isEmpty ? 0 : TextInputMasks.unMaskWeightFormatted(weightEC.text);
      final int quantity = _product.isSelected ? 1 : int.parse(quantityEC.text);
      final double fullPrice = _product.isSelected
          ? ProductModel.changeFullPriceWeight(price, weight)
          : ProductModel.changeFullPriceQuantity(price, quantity);
      final DateTime timestamp = DateTime.now();
      final bool isSelected = _product.isSelected;

      await _productListRepository.update(
        user!.uid,
        ProductModel(
          id: id,
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
