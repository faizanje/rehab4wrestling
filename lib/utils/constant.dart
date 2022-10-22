import 'package:flutter/material.dart';

class MyFont {
  static const fontModernist = 'Sk-Modernist';
}

class MyColor {
  // static const Color orangeLight = Color(0xfff5af36);
  // static const Color orangeLight = Color(0xfff5af36);
  static const Color orangeLight = Color(0xFFFCCF31);
  // static const Color orangeLight = Color(0xfff5af36);
  // static const Color orangeDark = Color(0xFFF55555);
  static const Color orangeDark = Color(0xFFF59255);
  static const Color blueColor = Color(0xff5B86E5);
  static const Color yellowTransparent = Color(0xb5c48104);
  static LinearGradient linearGradient = const LinearGradient(
    colors: [
      orangeLight,
      orangeDark,
      // Color(0xff36D1DC),
      // Color(0xff5B86E5),
    ],
  );

  static LinearGradient selectedlinearGradient = LinearGradient(
    colors: [
      orangeDark,
      orangeLight,
    ],
  );
}
