import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:market_list/core/auth/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/services/product/product_service.dart';

class HomeController extends GetxController {
  HomeController({
    required AuthService authService,
    required ProductService productService,
  })  : _authService = authService,
        _productService = productService;

  final AuthService _authService;
  final ProductService _productService;

  final RxBool loading = RxBool(false);
  final Rxn<List<ProductModel>> _productList = Rxn<List<ProductModel>>();

  User? get user => _authService.user;
  List<ProductModel>? get productList => _productList.value;

  @override
  void onInit() {
    readAll();
    super.onInit();
  }

  void readAll() {
    _productList.bindStream(_productService.readAll(user!.uid));
  }

  Future<void> remove(ProductModel product) async {
    await _productService.remove(user!.uid, product);
  }

  Future<void> removeAll() async {
    Get.back<dynamic>();
    loading.toggle();
    await _productService.removeAll(user!.uid);
  }

  int listAmountsCalculate() => productList!
      .map((ProductModel product) => product.quantity)
      .reduce((int firstValue, int lastValue) => firstValue + lastValue);

  double listFullPriceCalculate() => productList!
      .map((ProductModel product) => product.fullPrice)
      .reduce((double firstValue, double lastValue) => firstValue + lastValue);

  void goToSavePage() {
    Get.toNamed<dynamic>('/save');
  }

  void goToEditPage(ProductModel product) {
    Get.toNamed<dynamic>('/save', arguments: product);
  }
}
