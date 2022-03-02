import 'package:get/get.dart';
import './save_controller.dart';

class SaveBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SaveController(
        authService: Get.find(),
        productService: Get.find(),
      ),
    );
  }
}
