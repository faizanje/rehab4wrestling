import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/utils/validators.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';
import 'package:rehab4wrestling/widgets/auth_header.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController emailController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final FocusNode forgotFocusNode = FocusNode();

  @override
  void initState() {
    forgotFocusNode.addListener(() {
      controller.borderColor[0] =
          forgotFocusNode.hasFocus ? Colors.cyan : Colors.black26;
    });
    super.initState();
  }

  @override
  void dispose() {
    forgotFocusNode.dispose();
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
                        "Forgot \nPassword",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Please enter your valid email.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onTap: () {
                          controller.borderColor[0] = Colors.cyan;
                        },
                        validator: getRequiredValidator(),
                        focusNode: forgotFocusNode,
                        decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Obx(() {
                                return SvgPicture.asset(
                                  'assets/email.svg',
                                  color: controller.borderColor[0],
                                );
                              }),
                            )),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      AnimatedCustomButton(
                        title: "Submit",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controller.flag.value = true;
                            Future.delayed(const Duration(seconds: 1), () {
                              Get.toNamed(Routes.HOME);
                            });
                          } else {
                            Get.back();
                            controller.flag.value = false;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 16,
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

// class ForgotPasswordView extends GetView<AuthController> {
//   TextEditingController emailController = TextEditingController();
//
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
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Forgot \nPassword",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 36,
//                             ,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 16.0),
//                         child: Text(
//                           "Please enter your valid email.",
//                           style: TextStyle(
//                             color: Colors.black.withOpacity(0.7),
//                             fontSize: 18,
//                             ,
//                             package: 'asset:fonts/Sk-Modernist-Regular.otf',
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       TextFormField(
//                         onTap: () {
//                           controller.borderColor[0] = Colors.cyan;
//                         },
//                         validator: getRequiredValidator(),
//                         focusNode: controller.forgotFocusNode.value,
//                         decoration: InputDecoration(
//                             hintText: "Email",
//                             labelText: "Email",
//                             prefixIconConstraints:
//                             const BoxConstraints(minWidth: 0, minHeight: 0),
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12),
//                               child: Obx(() {
//                                 return SvgPicture.asset(
//                                   'assets/email.svg',
//                                   color: controller.borderColor[0],
//                                 );
//                               }),
//                             )),
//                       ),
//
//                       const SizedBox(
//                         height: 26,
//                       ),
//                       AnimatedCustomButton(
//                         title: "Submit",
//                         onTap: () {
//                           if (_formKey.currentState!.validate()) {
//                             controller.flag.value = true;
//                             Future.delayed(const Duration(seconds: 1), () {
//                               Get.toNamed(Routes.HOME);
//                             });
//                           } else {
//                             Get.back();
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
//                             Get.toNamed(Routes.AUTH);
//                           },
//                           child: RichText(
//                             text: const TextSpan(
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: 'Don\'t have an account?',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//
//                                         color: Colors.black87)),
//                                 TextSpan(
//                                     text: ' SignUp!',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//
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
//   }
