import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  final ThemeData themeData = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.lightGreen,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0.0,
    ),

    colorScheme: const ColorScheme.light(
      primary: Colors.teal,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //       RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         side: BorderSide.none,
    //       ),
    //     ),
    //     padding: MaterialStateProperty.all(
    //       const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
    //     ),
    //     // backgroundColor: MaterialStateProperty.all(Colors.black),
    //     textStyle: MaterialStateProperty.all(
    //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //     ),
    //   ),
    // ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(color: Colors.white38),
      fillColor: Colors.black26,
      isDense: true,
      focusColor: Colors.lightGreenAccent,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),

      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(width: 1, color: Colors.yellow),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide:
        BorderSide(width: 1, color: Colors.lightGreen.withOpacity(0.5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
        BorderSide(width: 1, color: Colors.white.withOpacity(0.5)),
      ),
      // filled: true,
    ),
  );
}
