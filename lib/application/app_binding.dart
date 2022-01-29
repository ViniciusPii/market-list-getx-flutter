import 'package:get/get.dart';
import 'package:market_list/repositories/product_list_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductListRepository(),
      fenix: true,
    );
  }
}
