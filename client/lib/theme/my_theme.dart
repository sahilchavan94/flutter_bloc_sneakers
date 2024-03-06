import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
    textTheme: const TextTheme(

      //all the required text themes are defined
      displayLarge: TextStyle(
        color: Colors.black87,
        fontSize: 22.5,
        letterSpacing: -.05,
        height: 1,
        fontWeight: FontWeight.w400,
      ), // large

      displayMedium: TextStyle(
        fontSize: 15.5,
        height: 1.32,
        fontWeight: FontWeight.w400,
      ), 
      //medium
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        height: 1.2,
      ), //medium

      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        height: .4
      ), //small

      headlineLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        letterSpacing: -1.8,
        height: 1,
      ), //small headline

      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
  );
}
