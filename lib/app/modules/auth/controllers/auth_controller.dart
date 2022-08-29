import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxBool flag = false.obs;
  RxBool isHide = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
