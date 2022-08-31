import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child:Image.asset('assets/bg.png'),
    ),

          const SizedBox(height: 16,),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Wrestling for Rehab",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Sk-Modernist',
                        fontWeight: FontWeight.w700),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16.0,bottom: 26),
                    child: Text(
                      "Please login your account to use our app. If you are a new user, Please register yourself.",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 18,
                        fontFamily: 'Sk-Modernist',
                        package: 'asset:fonts/Sk-Modernist-Regular.otf',
                      ),
                    ),
                  ),
                  AnimatedCustomButton(
                    title: "Login",
                    onTap: () {
                      Future.delayed(Duration(milliseconds: 500),(){
                        Get.toNamed(Routes.LOGIN);
                      });
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17.0),
                    child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){

                          Get.toNamed(Routes.AUTH);
                        }, child: const Text("Register",
                          style: TextStyle(color: Colors.blueAccent,fontFamily:
                          MyFont.fontModernist,
                          fontWeight: FontWeight.w600,
                            fontSize: 16

                          ),))),
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
