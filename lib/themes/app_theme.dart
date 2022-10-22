import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rehab4wrestling/utils/constant.dart';

class MyThemes {
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.1),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 50,
          color: Colors.transparent,
          foregroundColor: Colors.black,
          // systemOverlayStyle: SystemUiOverlayStyle(
          //   // Status bar color
          //   statusBarColor: Colors.cyan,
          //   statusBarIconBrightness: Brightness.light,
          //   statusBarBrightness: Brightness.light,
          // ),
          centerTitle: true,
          // backgroundColor: Colors.cyan,
          elevation: 0.0,
        ),
        fontFamily: 'Sk-Modernist',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(
                  color: MyColor.orangeDark,
                ),
              ),
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Sk-Modernist')),
          ),
        ),
        buttonTheme: ButtonThemeData(
          height: 52,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: MyColor.orangeDark)),
        ),

        colorScheme: const ColorScheme.light(
          primary: MyColor.orangeDark,
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
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          focusColor: MyColor.orangeDark,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 1),
          border: InputBorder.none,

          floatingLabelStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w800,
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: MyColor.orangeDark),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: Color(0xffCCCCCC))),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: MyColor.orangeDark),
          ),

          // filled: true,
        ),
      );
}
