import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<UserCredential> login();
  Future<void> signOut();
}
