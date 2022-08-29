import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rehab4wrestling/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: MyThemes().themeData,
    ),
  );
}
