import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/modules/home/home_controller.dart';
import 'package:market_list/repositories/product_list_repository.dart';
import 'package:market_list/utils/masks/text_input_masks.dart';

class EditController extends GetxController {
  EditController(
    this._productListRepository,
    this._homeController,
  );

  final ProductListRepository _productListRepository;
  final HomeController _homeController;

  final ProductModel product = Get.arguments as ProductModel;

  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController productEC = TextEditingController();
  final TextEditingController quantityEC = TextEditingController();
  final TextEditingController priceEC = TextEditingController();
  final TextEditingController weightEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    productEC.text = product.productName;
    quantityEC.text = product.quantity.toString();
    priceEC.text = ProductModel.formatCurrency(product.price);
    weightEC.text = ProductModel.formatWeight(product.weight);
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
      final String id = product.id;
      final String productName = productEC.text.trim();
      final double price = TextInputMasks.unMaskCurrencyFormatted(priceEC.text);
      final double weight =
          weightEC.text.isEmpty ? 0 : TextInputMasks.unMaskWeightFormatted(weightEC.text);
      final int quantity = product.isSelected ? 1 : int.parse(quantityEC.text);
      final double fullPrice = product.isSelected
          ? ProductModel.changeFullPriceWeight(price, weight)
          : ProductModel.changeFullPriceQuantity(price, quantity);
      final DateTime timestamp = DateTime.now();
      final bool isSelected = product.isSelected;

      await _productListRepository.update(
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

      _homeController.readAll();
      isLoading();

      Get.back<dynamic>();
    }
  }
}
