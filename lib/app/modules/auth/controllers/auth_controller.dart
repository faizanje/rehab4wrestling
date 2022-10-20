import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/SnackbarUtils.dart';
import 'package:rehab4wrestling/utils/constant.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  RxBool flag = false.obs;
  RxBool isHide = false.obs;
  final count = 0.obs;

  // Color for border
  final RxList<Color> borderColor = [
    const Color(0xffCCCCCC),
    const Color(0xffCCCCCC),
    const Color(0xffCCCCCC)
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> resetPassword({required String email}) async {
    try {
      EasyLoading.show();
      final auth =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Get.toNamed(Routes.HOME);
      EasyLoading.showSuccess("Success!");
      SnackBarUtils.showSnackBar("Reset password link has been sent!");
      Get.toNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError("No user found for that email.");
        print('No user found for that email.');
      }
    }
  }

  Future<void> signInUser(String email, String password) async {
    EasyLoading.show(status: 'loading...');
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(userCredential.user);
      Get.offAllNamed(Routes.HOME);
      EasyLoading.showSuccess("Success!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showError("No user found for that email.");

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        EasyLoading.showError('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signUpUser(String email, String password) async {
    EasyLoading.show(status: 'loading...');
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.showSuccess('Success!');
      // SnackBarUtils.showSnackBar("Account created successfully");
      Get.offAllNamed(Routes.HOME);
      print("function end");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarUtils.showSnackBar('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SnackBarUtils.showSnackBar(
            'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
