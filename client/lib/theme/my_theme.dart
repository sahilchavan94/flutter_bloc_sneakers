import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData themeData = ThemeData(
      textTheme: TextTheme(
          displayLarge: GoogleFonts.roboto(
              fontSize: 22.5,
              letterSpacing: -.05,
              height: 1.45,
              fontWeight: FontWeight.w400), //large

          displaySmall: GoogleFonts.roboto(
              fontSize: 14, fontWeight: FontWeight.w300, height: .4), //small

          headlineLarge: GoogleFonts.roboto(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: -1.8,
            height: 1,
          ), //small headline

          bodySmall: GoogleFonts.roboto(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white)));
}
