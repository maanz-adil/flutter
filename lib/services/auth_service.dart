import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignInWeb =
  GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId: '641154885131-im9b85df3h38d8slh1td2tsvuub2ldvr.apps.googleusercontent.com', // Only needed for web
  );
  final GoogleSignIn _googleSignIn =
  GoogleSignIn(
    scopes: ['email', 'profile']
  );
  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // Web specific sign-in
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        return await _auth.signInWithPopup(authProvider);
      } else {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        print('google user ${googleUser}');
        if (googleUser == null) return null;
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser
            .authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the credential
        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}