import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mango/const/firebase.dart';
import 'package:get/get.dart';

class AuthenticationService {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late String myName;
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
      String _userUID = _firebaseAuth.currentUser!.uid;
      await firebaseFirestore
          .collection('users')
          .doc(_userUID)
          .get()
          .then((value) {
        myName = value['name'];
      });
      Get.snackbar("Đăng nhập thành công", "Xin chào ${myName}");
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (e.toString() ==
          '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
        Get.snackbar("Sai mật khẩu", "Hãy thử lại");
      } else if (e.toString() ==
          '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
        Get.snackbar("Tài khoản không tồn tại", "Hãy thử lại");
      } else {
        Get.snackbar("Đăng nhập thất bại", "Hãy thử lại");
      }
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
          "sdt": '',
          "address": '',
          "cart": []
        });
        Get.snackbar("Đăng ký thành công", "Chào mừng ${name} đến với MANGO");
        _clearControllers();
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      if (e.toString() ==
          '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
        Get.snackbar("Email đã được đăng ký", "Hãy thử lại");
      } else {
        Get.snackbar("Đăng ký thất bại", "Hãy thử lại");
      }
    }
  }

  Future<String?> edit({required String address, required String sdt}) async {
    try {
      String _userUID = _firebaseAuth.currentUser!.uid;
      await firebaseFirestore.collection('users').doc(_userUID).update({
        "address": address.trim(),
        "sdt": sdt.trim(),
      });
      Get.snackbar("Cập nhật thành công", "Thông tin của bạn đã được cập nhật");
      _clearControllers();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Cập nhật thất bại", "Hãy thử lại");
    }
  }

// <<<<<<< Updated upstream
// =======
  // Future<String> getUID() async {
  //   String _uid = _firebaseAuth.currentUser!.uid;
  //   firebaseFirestore.collection('users').doc(_uid).get().then(
  // (value) => null)
  // }
// >>>>>>> Stashed changes
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
