import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:rehab4wrestling/app/modules/auth/controllers/auth_controller.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/validators.dart';
import 'package:rehab4wrestling/widgets/animated_button.dart';
import 'package:rehab4wrestling/widgets/testfield_widget.dart';



class CreateAccountView extends GetView<AuthController> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff000000),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Color(0xff000000),
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: ExactAssetImage('assets/img4.jpg'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Color(0xff000000).withOpacity(0.7),
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            Positioned(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height-50,
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black26.withOpacity(0.2),
                          Colors.deepOrange.withOpacity(0.1)
                        ]),

                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create \nAccount",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 36,),

                        TextFormField(
                          cursorColor: Colors.lightGreen,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This feild is required';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightGreen,
                              )
                          ),

                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          cursorColor: Colors.lightGreen,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This feild is required';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightGreen,
                              )
                          ),

                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFieldWidget(textEditingController: passwordController,
                          hint: "Password",
                          prefixIcon: Icons.lock,
                          isHideIcon: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const SizedBox(height: 36,),
                        AnimatedCustomButton(
                          title: "Sign Up",
                          controller: controller,onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controller.flag.value = true;
                            Future.delayed(Duration(seconds: 1),(){
                              Get.toNamed(Routes.HOME);
                            });
                          }
                          else {
                            controller.flag.value = false;
                          }
                        },),
                        const SizedBox(height: 16,),
                        Center(
                          child: InkWell(
                            onTap: (){
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: 'Already have an account?',),
                                  TextSpan(text: ' Login!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreen)),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


