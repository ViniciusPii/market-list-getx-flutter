import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:market_list/application/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/login_repository.dart';
import 'package:market_list/repositories/product_list_repository.dart';

class HomeController extends GetxController {
  HomeController(
      {required ProductListRepository productListRepository,
      required LoginRepository loginRepository,
      required AuthService authService})
      : _productListRepository = productListRepository,
        _loginRepository = loginRepository,
        _authService = authService;

  final ProductListRepository _productListRepository;
  final LoginRepository _loginRepository;
  final AuthService _authService;

  final RxList<ProductModel> _productList = <ProductModel>[].obs;
  List<ProductModel> get productList => _productList;

  final RxBool loading = false.obs;

  late final User _user = _authService.user!;
  User get user => _user;

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
    _productList.value = await _productListRepository.readAll(_user.uid);
    isLoading();
    return _productList;
  }

  Future<void> remove(ProductModel product) async {
    isLoading();
    await _productListRepository.remove(_user.uid, product);
    isLoading();
    readAll();
  }

  Future<void> removeAll() async {
    Get.back<dynamic>();
    isLoading();
    await _productListRepository.removeAll(_user.uid);
    isLoading();
    readAll();
  }

  Future<void> signOut() async {
    await _loginRepository.logout();
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
