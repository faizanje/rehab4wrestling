import 'package:get/get.dart';

class InjuryCureController extends GetxController {
  late final String bodyPartKey;

  @override
  void onInit() {
    bodyPartKey = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
