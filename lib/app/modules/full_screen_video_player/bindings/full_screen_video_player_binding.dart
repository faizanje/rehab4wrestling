import 'package:get/get.dart';

import '../controllers/full_screen_video_player_controller.dart';

class FullScreenVideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FullScreenVideoPlayerController>(
      () => FullScreenVideoPlayerController(),
    );
  }
}
