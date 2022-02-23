import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/models/product_model.dart';
import 'package:market_list/repositories/login_repository.dart';
import 'package:market_list/repositories/product_list_repository.dart';

class HomeController extends GetxController {
  HomeController({
    required AuthService authService,
    required LoginRepository loginRepository,
    required ProductListRepository productListRepository,
  })  : _authService = authService,
        _loginRepository = loginRepository,
        _productListRepository = productListRepository;

  final AuthService _authService;
  final LoginRepository _loginRepository;
  final ProductListRepository _productListRepository;

  final RxBool loading = false.obs;
  final Rxn<List<ProductModel>> _productList = Rxn<List<ProductModel>>();

  User? get user => _authService.user;
  List<ProductModel>? get productList => _productList.value;

  @override
  void onInit() {
    readAll();
    super.onInit();
  }

  void readAll() {
    loading.toggle();
    _productList.bindStream(_productListRepository.readAll(user!.uid));
  }

  Future<void> remove(ProductModel product) async {
    await _productListRepository.remove(user!.uid, product);
  }

  Future<void> removeAll() async {
    Get.back<dynamic>();
    loading.toggle();
    await _productListRepository.removeAll(user!.uid);
  }

  Future<void> signOut() async {
    await _loginRepository.logout();
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
    Get.toNamed<dynamic>('/edit', arguments: product);
  }
}
