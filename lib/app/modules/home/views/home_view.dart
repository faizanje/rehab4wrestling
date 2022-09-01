import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/packages/human_body_selector/human_body_selector.dart';
import 'package:rehab4wrestling/packages/human_body_selector/svg_painter/maps.dart';
import 'package:rehab4wrestling/utils/constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEFFF),
      appBar: AppBar(
        title: Text(
          "Select Body part",
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: MyHumanBodySelector(
                  map: Maps.MALE,
                  scale: 0.8,
                  strokeColor: Colors.black87,
                  selectedColor: MyColor.borderColor,
                  // dotColor: Colors.black,
                  // initialPainLevels: [],
                  onChanged: (bodyPart, active) {
                    controller.injuryName.value = active!.title;
                    Get.toNamed(Routes.INJURY_CURE);
                    // Future.delayed(const Duration(milliseconds: 500), () {
                    //
                    // });
                  },
                  onLevelChanged: (bodyPart) {
                    print(bodyPart.length);
                  },
                  multiSelect: false,
                  toggle: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
