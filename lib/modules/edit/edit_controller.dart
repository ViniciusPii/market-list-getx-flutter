import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/modules/home/home_controller.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';

class EditController extends GetxController {
  EditController({
    required ProductListRepository productListRepository,
    required HomeController homeController,
    required AuthService authService,
  })  : _productListRepository = productListRepository,
        _homeController = homeController,
        _authService = authService;

  final ProductListRepository _productListRepository;
  final HomeController _homeController;
  final AuthService _authService;

  late final User _user = _authService.user!;

  final ProductModel _product = Get.arguments as ProductModel;
  ProductModel get product => _product;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController();
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();

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
    productEC.dispose();
    quantityEC.dispose();
    priceEC.dispose();
    weightEC.dispose();
    super.onClose();
  }

  final RxBool loading = false.obs;

  bool isLoading() {
    return loading.value = !loading.value;
  }

  Future<void> editProduct() async {
    if (form.currentState!.validate()) {
      isLoading();
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
        _user.uid,
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

      isLoading();
      _homeController.readAll();

      Get.back<dynamic>();
    }
  }
}
