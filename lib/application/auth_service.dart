import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/duration_extensions.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';
import 'package:get/route_manager.dart';

class AuthService extends GetxService {
  User? user;

  Future<void> init() async {
    await 2.seconds.delay();
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        this.user = user;
        if (user == null) {
          Get.offAllNamed<dynamic>('/login');
        } else {
          Get.offAllNamed<dynamic>('/home');
        }
      },
    );
  }
}
