import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:human_body_selector/human_body_selector.dart';
import 'package:human_body_selector/svg_painter/maps.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(

        backgroundColor: Colors.lightGreen,
        automaticallyImplyLeading: false,
        title: const Text(
          'Welcome Faizan', style: TextStyle(color: Colors.black),),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Stack(
            alignment: Alignment.topCenter,
            children: [

              controller.injuryName.value.isEmpty ? const Positioned(
                  top: 20,
                  left: 12,
                  child: Text("Select Body part", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),)) :
              Positioned(
                top: 20,
                left: 12,
                child: Text(controller.injuryName.value, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),),
              ),
              Padding(
                padding: const EdgeInsets.all(45.0),
                child: HumanBodySelector(
                  map: Maps.MALE,
                  strokeColor: Colors.lightGreenAccent,
                  selectedColor: Colors.redAccent,
                  dotColor: Colors.black,
                  onChanged: (bodyPart, active) {
                    controller.injuryName.value = active!.title;
                    Future.delayed(Duration(milliseconds: 500), () {
                      Get.toNamed(Routes.INJURY_CURE);
                    });
                  },
                  onLevelChanged: (bodyPart) {
                    print(bodyPart.length);
                  },
                  multiSelect: false,
                  toggle: true,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
