import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<User?> login();
  Future<void> updateDisplayName(String name);
  Future<void> signOut();
}
