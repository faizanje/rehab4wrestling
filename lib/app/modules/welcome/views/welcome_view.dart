import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.red,
                margin: EdgeInsets.only(top: Get.height * 0.1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.blue,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      // child: AspectRatio(
                      //   aspectRatio: 16 / 9,
                      child: Image.asset(
                          'assets/Peak Performance_Original_Logo 2.png'),
                      // ),
                    ),
                    const Text(
                      'Est. 1996',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rehab for Wrestling",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 26),
                    child: Text(
                      "Please login your account to use our app. If you are a new user, Please register yourself.",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  AnimatedCustomButton(
                    title: "Login",
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 500), () {
                        Get.toNamed(Routes.LOGIN);
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17.0),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.AUTH);
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: MyColor.orangeDark,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
