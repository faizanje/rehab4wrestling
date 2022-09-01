import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void onReady() {
    super.onReady();
  }
}
