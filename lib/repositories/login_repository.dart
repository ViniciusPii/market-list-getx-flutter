import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  Future<UserCredential> login() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return FirebaseAuth.instance.signInWithCredential(credential);
    }
    throw Exception('Erro ao realizar login com Google');
  }

  Future<void> logout() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }
}
