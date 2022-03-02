import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Future<User?> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    }
    throw Exception('Erro ao realizar login com Google');
  }

  @override
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    _auth.signOut();
  }

  @override
  Future<void> updateDisplayName(String name) async {
    await _auth.currentUser!.updateDisplayName(name);
  }

  @override
  Future<void> updatePhotoProfile(String url) async {
    await _auth.currentUser!.updatePhotoURL(url);
  }
}
