import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/utils/validators.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';
import 'package:rehab4wrestling/widgets/auth_header.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());
  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  @override
  void initState() {
    focusNodes.forEach((node) {
      node.addListener(() {
        controller.borderColor[0]= focusNodes[0].hasFocus?Colors.cyan:Colors.black26;
        controller.borderColor[1]= focusNodes[1].hasFocus?Colors.cyan:Colors.black26;
        controller.borderColor[2]= focusNodes[2].hasFocus?Colors.cyan:Colors.black26;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    focusNodes[0].dispose();
    focusNodes[1].dispose();
    focusNodes[2].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                            fontFamily: 'Sk-Modernist',
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Please enter the following details to get registered.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 18,
                            fontFamily: 'Sk-Modernist',
                            package: 'asset:fonts/Sk-Modernist-Regular.otf',
                          ),
                        ),
                      ),

                      TextFormField(
                        onTap: () {
                          controller.borderColor[0] = Colors.cyan;
                        },
                        validator: getRequiredValidator(),
                        focusNode: focusNodes[0],
                        decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Name",
                            prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Obx(() {
                                return SvgPicture.asset(
                                  'assets/profile.svg',
                                  color: controller.borderColor[0],
                                );
                              }),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onTap: () {
                          controller.borderColor[1] = Colors.cyan;
                        },
                        validator: getRequiredValidator(),
                        focusNode: focusNodes[1],
                        decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            prefixIconConstraints:
                            const BoxConstraints(minWidth: 0, minHeight: 0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Obx(() {
                                return SvgPicture.asset(
                                  'assets/email.svg',
                                  color: controller.borderColor[1],
                                );
                              }),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        return TextFormField(
                          focusNode: focusNodes[2],
                          validator: getRequiredValidator(),
                          obscureText: controller.isHide.value,
                          onTap: () {
                            controller.borderColor[1] = Colors.cyan;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                              suffixIcon: Obx(() {
                                return IconButton(
                                  icon: Icon(Icons.remove_red_eye,
                                      color: controller.isHide.isTrue
                                          ? Colors.cyan
                                          : Colors.grey),
                                  onPressed: () {
                                    controller.isHide.isTrue
                                        ? controller.isHide.value = false
                                        : controller.isHide.value = true;
                                  },
                                );
                              }),
                              prefixIcon: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 12),
                                child: Obx(() {
                                  return SvgPicture.asset('assets/password.svg',
                                      color: controller.borderColor[2]);
                                }),
                              )),
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
                            Future.delayed(const Duration(seconds: 1), () {
                              Get.toNamed(Routes.HOME);
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
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: MyFont.fontModernist,
                                        color: Colors.black87)),
                                TextSpan(
                                    text: ' Login!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: MyFont.fontModernist,
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

//
// class CreateAccountView extends GetView<AuthController> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: const Color(0xffffffff),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const AuthHeader(),
//               Expanded(
//                 child: SingleChildScrollView(
//                    padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Register",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 36,
//                             fontFamily: 'Sk-Modernist',
//                             fontWeight: FontWeight.w700),
//                       ),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(vertical: 16.0),
//                          child: Text(
//                           "Please enter the following details to get registered.",
//                           style: TextStyle(
//                               color: Colors.black.withOpacity(0.7),
//                               fontSize: 18,
//                               fontFamily: 'Sk-Modernist',
//                               package: 'asset:fonts/Sk-Modernist-Regular.otf',
//                               ),
//                       ),
//                        ),
//
//                       TextFormField(
//                         onTap: () {
//                           controller.borderColor[0] = Colors.cyan;
//                         },
//                         validator: getRequiredValidator(),
//                         focusNode: controller.focusNodes[0],
//                         decoration: InputDecoration(
//                             hintText: "Name",
//                             labelText: "Name",
//                             prefixIconConstraints:
//                                 const BoxConstraints(minWidth: 0, minHeight: 0),
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12),
//                               child: Obx(() {
//                                 return SvgPicture.asset(
//                                   'assets/profile.svg',
//                                   color: controller.borderColor[0],
//                                 );
//                               }),
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         onTap: () {
//                           controller.borderColor[1] = Colors.cyan;
//                         },
//                         validator: getRequiredValidator(),
//                         focusNode: controller.focusNodes[1],
//                         decoration: InputDecoration(
//                             hintText: "Email",
//                             labelText: "Email",
//                             prefixIconConstraints:
//                                 const BoxConstraints(minWidth: 0, minHeight: 0),
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12),
//                               child: Obx(() {
//                                 return SvgPicture.asset(
//                                   'assets/email.svg',
//                                   color: controller.borderColor[1],
//                                 );
//                               }),
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Obx(() {
//                         return TextFormField(
//                           focusNode: controller.focusNodes[2],
//                           validator: getRequiredValidator(),
//                           obscureText: controller.isHide.value,
//                           onTap: () {
//                             controller.borderColor[1] = Colors.cyan;
//                           },
//                           decoration: InputDecoration(
//                               hintText: "Password",
//                               labelText: "Password",
//                               prefixIconConstraints:
//                                   const BoxConstraints(minWidth: 0, minHeight: 0),
//                               suffixIcon: Obx(() {
//                                 return IconButton(
//                                   icon: Icon(Icons.remove_red_eye,
//                                       color: controller.isHide.isTrue
//                                           ? Colors.cyan
//                                           : Colors.grey),
//                                   onPressed: () {
//                                     controller.isHide.isTrue
//                                         ? controller.isHide.value = false
//                                         : controller.isHide.value = true;
//                                   },
//                                 );
//                               }),
//                               prefixIcon: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 12),
//                                 child: Obx(() {
//                                   return SvgPicture.asset('assets/password.svg',
//                                       color: controller.borderColor[2]);
//                                 }),
//                               )),
//                         );
//                       }),
//                       const SizedBox(
//                         height: 36,
//                       ),
//                       AnimatedCustomButton(
//                         title: "Sign Up",
//                         onTap: () {
//                           if (_formKey.currentState!.validate()) {
//                             controller.flag.value = true;
//                             Future.delayed(const Duration(seconds: 1), () {
//                               Get.toNamed(Routes.HOME);
//                             });
//                           } else {
//                             controller.flag.value = false;
//                           }
//                         },
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       Center(
//                         child: InkWell(
//                           onTap: () {
//                             Get.toNamed(Routes.LOGIN);
//                           },
//                           child: RichText(
//                             text: const TextSpan(
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: 'Already have an account?',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontFamily: MyFont.fontModernist,
//                                         color: Colors.black87)),
//                                 TextSpan(
//                                     text: ' Login!',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: MyFont.fontModernist,
//                                         color: Colors.cyan)),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
