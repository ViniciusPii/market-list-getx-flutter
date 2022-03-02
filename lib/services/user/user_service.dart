import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

abstract class UserService {
  Future<User?> login();
  Future<void> signOut();
  Future<void> updateDisplayName(String name);
  Future<void> updatePhotoProfile(File file, String id);
}
