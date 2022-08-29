import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';


class TextFieldWidget extends GetView<AuthController> {
  TextFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    required this.isHideIcon,
  }) : super(key: key);
  final String hint;
  final bool isHideIcon;

  final TextEditingController textEditingController;
  final IconData prefixIcon;


  @override
  Widget build(BuildContext context) {
    return
      Obx(() {
        return TextFormField(
          controller: textEditingController,
          obscureText: isHideIcon?controller.isHide.value:false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This feild is required';
            }
            return null;
          },
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.lightGreen,
          decoration: InputDecoration(
              filled: true,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white38),
              fillColor: Colors.black26,
              isDense: true,
              focusColor: Colors.lightGreenAccent,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(width: 1, color: Colors.yellow),
              ),
              // errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(16)),
              //   borderSide: BorderSide(width: 1, color: Colors.red),
              // ),
              suffixIcon: isHideIcon ?
              Obx(() {
                return IconButton(
                  icon: Icon(Icons.remove_red_eye,
                      color: controller.isHide.isTrue
                          ? Colors.lightGreen
                          : Colors
                          .white38),
                  onPressed: () {
                    controller.isHide.isTrue
                        ? controller.isHide.value = false
                        : controller.isHide.value = true;
                  }
                  ,
                );
              })

                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                borderSide:
                BorderSide(width: 1, color: Colors.lightGreen.withOpacity(0.5)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
              ),
              prefixIcon: Icon(
                prefixIcon,
                color: Colors.lightGreen,
              )
          ),
        );
      });
  }
}