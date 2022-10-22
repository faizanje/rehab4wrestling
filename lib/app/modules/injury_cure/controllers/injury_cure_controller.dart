import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/models/args/BodyPartArgs.dart';

class InjuryCureController extends GetxController {
  late final String bodyPartKey;
  late final BodyPartArgs args;

  @override
  void onInit() {
    args = Get.arguments;
    bodyPartKey = args.bodyPartKey;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
