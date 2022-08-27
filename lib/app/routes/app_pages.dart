import 'package:get/get.dart';

import '../modules/full_screen_video_player/bindings/full_screen_video_player_binding.dart';
import '../modules/full_screen_video_player/views/full_screen_video_player_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FULL_SCREEN_VIDEO_PLAYER,
      page: () => FullScreenVideoPlayerView(),
      binding: FullScreenVideoPlayerBinding(),
    ),
  ];
}
