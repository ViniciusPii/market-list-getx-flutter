import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/repositories/login_repository.dart';
import 'package:market_list/repositories/product_list_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProductListRepository(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginRepository(),
      fenix: true,
    );
    Get.put(
      AuthService(),
    ).init();
  }
}
