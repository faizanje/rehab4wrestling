import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:human_body_selector/human_body_selector.dart';
import 'package:human_body_selector/svg_painter/maps.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/utils/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEEFFF),
        body: SingleChildScrollView(
          child: Column(
              children: [
                 const Padding(
                   padding: EdgeInsets.only(top: 16.0),
                   child: Text("Select Body part", style: TextStyle(
                       color: Colors.black87,
                       fontSize: 22,
                       fontFamily: MyFont.fontModernist,
                       fontWeight: FontWeight.bold),),
                 ) ,
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: HumanBodySelector(
                      map: Maps.MALE,
                      scale: 0.8,
                      strokeColor: Colors.black87,
                      selectedColor: Colors.cyanAccent,
                      dotColor: Colors.black,
                      onChanged: (bodyPart, active) {
                        controller.injuryName.value = active!.title;
                        Future.delayed(const Duration(milliseconds: 500), () {
                          Get.toNamed(Routes.INJURY_CURE);
                        });
                      },
                      onLevelChanged: (bodyPart) {
                        print(bodyPart.length);
                      },
                      multiSelect: false,
                      toggle: true,
                    ),
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
