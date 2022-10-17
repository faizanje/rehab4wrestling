import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  //TODO: Implement WelcomeController

  final count = 0.obs;

  @override
  void onInit() {
    isUserSignIn();
    super.onInit();
  }

  void isUserSignIn(){
    FirebaseAuth.instance
        .idTokenChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Get.toNamed(Routes.HOME);
      }
    });
  }
}
