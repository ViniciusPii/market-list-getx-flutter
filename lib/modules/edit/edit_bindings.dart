import 'package:get/get.dart';
import './edit_controller.dart';

class EditBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditController(
        productListRepository: Get.find(),
        homeController: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
