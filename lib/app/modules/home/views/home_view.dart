import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/app/data/FirebaseService.dart';
import 'package:rehab4wrestling/app/data/constants/constants.dart';
import 'package:rehab4wrestling/app/routes/app_pages.dart';
import 'package:rehab4wrestling/packages/human_body_selector/human_body_selector.dart';
import 'package:rehab4wrestling/packages/human_body_selector/svg_painter/constant.dart';
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
        title: const Text(
          "Select Body part",
          style: const TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () async {
                            EasyLoading.show();
                            await FirebaseService.logout();
                            EasyLoading.dismiss();
                            Get.offAllNamed(Routes.WELCOME);
                          },
                          child: const Text('Yes')),
                    ],
                  );
                },
                context: context,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: MyHumanBodySelector(
                  map: Maps.MALE,
                  scale: 0.8,
                  clickableBodyParts: kAllowedBodyParts,
                  // initialPainLevels: [],
                  // initialSelectedPartsList: [],
                  strokeColor: Colors.black87,
                  selectedColor: MyColor.borderColor,
                  // dotColor: Colors.black,
                  // initialPainLevels: [],
                  onChanged: (bodyPart, active) {
                    // print(active?.title);
                    // controller.injuryName.value = active!.title;
                    final bodyPartKey = kBodyPathToDbPathMap[active!.title]!;
                    Get.toNamed(Routes.INJURY_CURE, arguments: bodyPartKey);
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
