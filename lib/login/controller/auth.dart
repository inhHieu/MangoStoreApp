import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mango/const/firebase.dart';
import 'package:get/get.dart';

class AuthenticationService {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //---------
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'signed in';
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  Future<String?> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) {
        String _userId = result.user!.uid;
        // _addUserToFirestore(_userId);
        firebaseFirestore.collection('users').doc(_userId).set({
          "name": name.trim(),
          "id": _userId,
          "email": email.trim(),
          "cart": []
        });
        _clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign Up Failed", "Try again");
    }
  }

  // _addUserToFirestore(String userId) {
  //   firebaseFirestore.collection('users').doc(userId).set({
  //     "name": name.text.trim(),
  //     "id": userId,
  //     "email": email.text.trim(),
  //     "cart": []
  //   });
  // }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }
}
