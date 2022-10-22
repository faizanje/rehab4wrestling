import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/utils/constant.dart';

class AnimatedCustomButton extends StatelessWidget {
  const AnimatedCustomButton(
      {Key? key, required this.onTap, required this.title})
      : super(key: key);

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      width: double.infinity,
      text: title,
      isReverse: true,
      selectedTextColor: Colors.white,
      borderWidth: 1,
      backgroundColor: Colors.black,
      gradient: MyColor.linearGradient,
      borderRadius: 16,
      selectedGradientColor: MyColor.selectedlinearGradient,
      transitionType: TransitionType.CENTER_LR_IN,
      textStyle: const TextStyle(
        fontSize: 18,
        letterSpacing: 1,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      onPress: onTap,
    );
  }
}
