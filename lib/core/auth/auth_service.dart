import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService {
  AuthService({
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  User? get user => _auth.currentUser;

  Future<void> authentication() async {
    await 2.seconds.delay();
    _auth.userChanges().listen(
      (User? user) {
        if (user != null) {
          Get.offAllNamed<dynamic>('/home');
        } else {
          Get.offAllNamed<dynamic>('/login');
        }
      },
    );
  }
}
