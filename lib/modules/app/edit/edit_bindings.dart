import 'package:get/get.dart';
import './edit_controller.dart';

class EditBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditController(
        authService: Get.find(),
        productService: Get.find(),
      ),
    );
  }
}
