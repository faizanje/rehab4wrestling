import 'package:get/get.dart';

import '../controllers/injury_cure_controller.dart';

class InjuryCureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InjuryCureController>(
      () => InjuryCureController(),
    );
  }
}
