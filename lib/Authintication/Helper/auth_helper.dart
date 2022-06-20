import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/Authintication/Helper/fireStore_Helper.dart';

import '../../Screens/Home.dart';

class Auth_helper {
  Auth_helper._();
  bool loading=true;

  static Auth_helper auth_helper = Auth_helper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signup(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'Password is weak');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'Email is already in use');
    }
  }
  }

  Future<UserCredential?> signin(String email,String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Get.off(()=>Home());

    } on FirebaseAuthException catch (e) {
      loading=false;
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password');
      }
    }
  }

  resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    Fluttertoast.showToast(msg: 'Reset password link has been sent to your email');
  }



  signOut() async {
    await firebaseAuth.signOut();
  }

  bool checkEmailVerification() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  Future<User?> getCurrentUser() async {
    try {
      var currentuser = firebaseAuth.currentUser;
      if (currentuser != null) {
        print(currentuser);
        return firebaseAuth.currentUser;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  String? getUserId() {
    try {
      return firebaseAuth.currentUser?.uid;
    } on Exception catch (e) {
      // TODO
    }
  }

  bool checkUser() {
    if (firebaseAuth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}