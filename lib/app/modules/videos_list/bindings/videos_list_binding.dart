import 'package:get/get.dart';

import '../controllers/videos_list_controller.dart';

class VideosListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosListController>(
      () => VideosListController(),
    );
  }
}
