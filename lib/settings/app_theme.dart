import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static Color mainColor = const Color(0xFFE1B529);
  static Color secondColor = const Color(0xFF0E5069);
  static Color thirdColor = const Color(0xFF0000FF);
  static Color backgroundColor = const Color(0xE0E0E0FF);
  static Color appBarColor = const Color(0xFF0E5069);
  static Color bottomNavBarColor = const Color(0xFF0E5069);
  static Color summaryQAColor = const Color(0xFFEFCEB0);

  static Color appBarHeaderFontColor = const Color(0xFFFFFFFF);
  static Color basicTextFontColor = const Color(0xFF000000);
  static Color lightFontColor = const Color(0xAA000000);


  static TextStyle appBarHeaderFontStyle = GoogleFonts.varelaRound(
      textStyle: TextStyle(
          color: AppTheme.appBarHeaderFontColor,
          fontSize: 20,
          fontWeight: FontWeight.bold));
  static TextStyle basicTextFontStyle = GoogleFonts.varelaRound(
      textStyle: TextStyle(
          color: AppTheme.basicTextFontColor,
          fontSize: 18,
          fontWeight: FontWeight.normal));
  static TextStyle lightFontStyle = GoogleFonts.varelaRound(
      textStyle: TextStyle(
          color: AppTheme.lightFontColor,
          fontSize: 12,
          fontWeight: FontWeight.w400));
  static TextStyle buttonFontStyle = GoogleFonts.varelaRound(
    textStyle: TextStyle(
        color: AppTheme.secondColor,
        fontSize: 18,
        fontWeight: FontWeight.bold),
  );
  static TextStyle dialogTitleFontStyle = GoogleFonts.varelaRound(
    textStyle: TextStyle(
        color: AppTheme.mainColor,
        fontSize: 22,
        fontWeight: FontWeight.bold),
  );

}