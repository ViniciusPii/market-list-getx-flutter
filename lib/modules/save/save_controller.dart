import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/modules/home/home_controller.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';

class SaveController extends GetxController {
  SaveController({
    required ProductListRepository productListRepository,
    required HomeController homeController,
    required AuthService authService,
  })  : _productListRepository = productListRepository,
        _homeController = homeController,
        _authService = authService;

  final ProductListRepository _productListRepository;
  final HomeController _homeController;
  final AuthService _authService;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController(text: '1');
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();

  @override
  void onClose() {
    productEC.dispose();
    quantityEC.dispose();
    priceEC.dispose();
    weightEC.dispose();
    super.onClose();
  }

  final RxBool loading = false.obs;
  final RxBool selected = false.obs;
  late final User _user = _authService.user!;

  bool isLoading() {
    return loading.value = !loading.value;
  }

  bool isSelected() {
    quantityEC.clear();
    weightEC.clear();
    return selected.value = !selected.value;
  }

  Future<void> saveProduct() async {
    if (form.currentState!.validate()) {
      isLoading();
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
        _user.uid,
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

      isLoading();
      _homeController.readAll();

      Get.back<dynamic>();
    }
  }
}
