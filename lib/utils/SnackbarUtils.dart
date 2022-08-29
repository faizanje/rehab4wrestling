import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarUtils {
  static showError(String message, [int duration = 2]) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: Colors.red,
      duration: Duration(seconds: duration),
    ));
  }

  static showSnackBar(String message, [int duration = 2]) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: Duration(seconds: duration),
    ));
  }

  static showScaffoldSnackBar(BuildContext buildContext, String message) {
    ScaffoldMessenger.of(buildContext)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
