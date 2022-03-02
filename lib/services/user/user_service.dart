import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<UserCredential> login();
  Future<void> signOut();
}
