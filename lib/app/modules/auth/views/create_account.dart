import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/utils/validators.dart';
import 'package:rehab4wrestling/widgets/MyValueBuilder.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';
import 'package:rehab4wrestling/widgets/auth_header.dart';

class CreateAccountView extends GetView<AuthController> {
   CreateAccountView({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     onPressed: () {
        //       Get.back();
        //     },
        //   ),
        // ),
        backgroundColor: const Color(0xffffffff),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Please enter the following details to get registered.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyValueBuilder<bool>(
                        initialValue: false,
                        builder: (value, updateFn) {
                          return Focus(
                            onFocusChange: (hasFocus) {
                              print('Has focus ${hasFocus}');
                              updateFn(hasFocus);
                            },
                            child: TextFormField(
                              validator: getRequiredEmail(),
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                labelText: "Email",
                                prefixIconConstraints: const BoxConstraints(
                                    minWidth: 0, minHeight: 0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: SvgPicture.asset(
                                    'assets/email.svg',
                                    color: value ? MyColor.borderColor : null,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyValueBuilder<bool>(
                          initialValue: false,
                          builder: (value, updateFn) {
                            return Focus(
                              onFocusChange: (hasFocus) {
                                print('Has focus ${hasFocus}');
                                updateFn(hasFocus);
                              },
                              child: Obx(() {
                                return TextFormField(
                                  validator: getRequiredValidator(),
                                  obscureText: controller.isHide.value,
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      labelText: "Password",
                                      prefixIconConstraints:
                                      const BoxConstraints(
                                          minWidth: 0, minHeight: 0),
                                      suffixIcon: Obx(() {
                                        return IconButton(
                                          icon: Icon(controller.isHide.isTrue
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () {
                                            controller.isHide.isTrue
                                                ? controller.isHide.value =
                                            false
                                                : controller.isHide.value =
                                            true;
                                          },
                                        );
                                      }),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: SvgPicture.asset(
                                          'assets/password.svg',
                                          color: value
                                              ? MyColor.borderColor
                                              : null,
                                        ),
                                      )),
                                );
                              }),
                            );
                          }),

                      const SizedBox(
                        height: 36,
                      ),
                      AnimatedCustomButton(
                        title: "Sign Up",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controller.flag.value = true;
                            print(emailController.text);
                            controller.signUpUser(emailController.text,
                                passwordController.text);
                            Future.delayed(const Duration(seconds: 1), () {
                            });
                          } else {
                            controller.flag.value = false;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            // Get.toNamed(Routes.LOGIN);
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(fontFamily: 'Sk-Modernist'),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87)),
                                TextSpan(
                                    text: ' Login!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.cyan)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }


