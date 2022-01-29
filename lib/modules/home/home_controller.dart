import 'package:get/get.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/product_list_repository.dart';

class HomeController extends GetxController {
  HomeController(this._productListRepository);

  final ProductListRepository _productListRepository;

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  List<ProductModel> get productList => _productList;

  final RxBool loading = false.obs;

  @override
  void onInit() {
    readAll();
    super.onInit();
  }

  bool isLoading() {
    return loading.value = !loading.value;
  }

  Future<List<ProductModel>> readAll() async {
    isLoading();
    _productList.value = await _productListRepository.readAll();
    isLoading();
    return _productList;
  }

  Future<void> remove(ProductModel product) async {
    isLoading();
    await _productListRepository.remove(product);
    readAll();
    isLoading();
  }

  Future<void> removeAll() async {
    isLoading();
    await _productListRepository.removeAll();
    readAll();
    isLoading();
  }

  int listAmountsCalculate() => _productList
      .map((ProductModel product) => product.quantity)
      .reduce((int firstValue, int lastValue) => firstValue + lastValue);

  double listFullPriceCalculate() => _productList
      .map((ProductModel product) => product.fullPrice)
      .reduce((double firstValue, double lastValue) => firstValue + lastValue);

  void goToSavePage() {
    Get.toNamed<dynamic>('/save');
  }

  void goToEditPage(ProductModel product) {
    Get.toNamed<dynamic>('/edit', arguments: product);
  }
}
