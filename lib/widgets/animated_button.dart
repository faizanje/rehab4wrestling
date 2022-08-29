
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';

class AnimatedCustomButton extends StatelessWidget {
  const AnimatedCustomButton({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.title

  }) :super(key: key);

  final AuthController controller;
  final VoidCallback onTap;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedButton(
          width: double.infinity,
          text: title,
          isReverse: false,
          selectedTextColor: Colors.black,
          borderWidth: 1,
          borderColor: Colors.lightGreen,
          backgroundColor: Colors.grey.withOpacity(0.2),
          borderRadius: 16,
          selectedBackgroundColor: controller.flag.isTrue
              ? Colors.lightGreen
              : Colors.redAccent,
          transitionType: TransitionType.CENTER_LR_IN,
          textStyle: const TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.w500),
          onPress: onTap
      );
    });
  }
}
