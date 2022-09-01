import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/create_account.dart';
import '../modules/auth/views/forgot_password.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/full_screen_video_player/bindings/full_screen_video_player_binding.dart';
import '../modules/full_screen_video_player/views/full_screen_video_player_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/injury_cure/bindings/injury_cure_binding.dart';
import '../modules/injury_cure/views/injury_cure_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;
  // static const INITIAL = Routes.HOME;

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
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => CreateAccountView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.INJURY_CURE,
      page: () => InjuryCureView(),
      binding: InjuryCureBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
