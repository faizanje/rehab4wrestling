import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';
import 'package:rehab4wrestling/utils/validators.dart';
import 'package:rehab4wrestling/widgets/MyValueBuilder.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';
import 'package:rehab4wrestling/widgets/auth_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());
  List<FocusNode> loginFocusNode = [
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    loginFocusNode.forEach((node) {
      node.addListener(() {
        controller.borderColor[0] =
            loginFocusNode[0].hasFocus ? Colors.cyan : Colors.black26;
        controller.borderColor[1] =
            loginFocusNode[1].hasFocus ? Colors.cyan : Colors.black26;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    loginFocusNode[0].dispose();
    loginFocusNode[1].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffffffff),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AuthHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Please enter your email and password to login.",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
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
                              validator: getRequiredValidator(),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.FORGOT_PASSWORD);
                            },
                            child: const Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.cyan,
                                  fontSize: 14),
                            )),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      AnimatedCustomButton(
                        title: "Login",
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
                            Get.toNamed(Routes.AUTH);
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(fontFamily: 'Sk-Modernist'),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87)),
                                TextSpan(
                                    text: ' Signup',
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

// class LoginView extends GetView<AuthController> {
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
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 36,
//                             ,
//                             fontWeight: FontWeight.w700),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 16.0),
//                         child: Text(
//                           "Please enter your email and password to login.",
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
//                         focusNode: controller.loginFocusNode[0],
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
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Obx(() {
//                         return TextFormField(
//                           focusNode: controller.loginFocusNode[1],
//                           validator: getRequiredValidator(),
//                           obscureText: controller.isHide.value,
//                           onTap: () {
//                             controller.borderColor[1] = Colors.cyan;
//                           },
//                           decoration: InputDecoration(
//                               hintText: "Password",
//                               labelText: "Password",
//                               prefixIconConstraints:
//                               const BoxConstraints(minWidth: 0, minHeight: 0),
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
//                                 const EdgeInsets.symmetric(horizontal: 12),
//                                 child: Obx(() {
//                                   return SvgPicture.asset('assets/password.svg',
//                                       color: controller.borderColor[1]);
//                                 }),
//                               )),
//                         );
//                       }),
//
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(onPressed: (){
//                           Get.toNamed(Routes.FORGOT_PASSWORD);
//                         }, child: const Text(
//                           "Forgot password?",
//                           style: TextStyle(
//
//                             fontWeight: FontWeight.w600,
//                            color: Colors.cyan,
//                             fontSize: 14
//                           ),
//                         )),
//                       ),
//                       const SizedBox(
//                         height: 26,
//                       ),
//                       AnimatedCustomButton(
//                         title: "Login",
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
// }
