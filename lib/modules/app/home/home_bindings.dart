import 'package:get/get.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        authService: Get.find(),
        userService: Get.find(),
        productService: Get.find(),
      ),
    );
  }
}
