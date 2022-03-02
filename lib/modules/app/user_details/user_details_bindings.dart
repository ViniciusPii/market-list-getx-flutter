import 'package:get/get.dart';
import 'user_details_controller.dart';

class UserDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => UserDetailsController(
        userService: Get.find(),
        authService: Get.find(),
      ),
    );
  }
}
