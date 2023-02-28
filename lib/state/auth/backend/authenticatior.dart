import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instragram_clone/state/auth/constant/constants.dart';
import 'package:instragram_clone/state/auth/models/auth_results.dart';
import 'package:instragram_clone/state/auth/post/typdef/user_id.dart';

import '../../user_info/models/user_info_payload.dart';

class Authenticator {
  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;
  bool get isAlreadyLoggedIn => userId != null;
  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';
  String? get email => FirebaseAuth.instance.currentUser?.email;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  // Future<AuthResult> loginWithFacebook() async {
  //   final loginResult = await FacebookAuth.instance.login();
  //   final token = loginResult.accessToken!.token;
  //   if (token == null) {
  //     // useer has aborted the logingIN process
  //     return AuthResult.aborted;
  //   }
  //   final authCredential = FacebookAuthProvider.credential(token);
  //   try {
  //     await FirebaseAuth.instance.signInWithCredential(authCredential);
  //     return AuthResult.success;
  //   } on FirebaseAuthException catch (e) {
  //     final email = e.email;
  //     final credential = e.credential;
  //     if (e.code == Constants.accountExistingWithDifferentCredentials &&
  //         email != null &&
  //         credential != null) {
  //       final providers =
  //           await FirebaseAuth.instance.fetchSignInMethodsForEmail(
  //         email,
  //       );
  //       if (providers.contains(Constants.googleCom)) {
  //         await loginWithGoogle();
  //         FirebaseAuth.instance.currentUser?.linkWithCredential(
  //           credential,
  //         );
  //       }
  //       return AuthResult.success;
  //     }

  //     return AuthResult.failure;
  //   }
  // }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final authCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(authCredential);

      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
