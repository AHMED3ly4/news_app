import 'package:flutter/material.dart';

class AppTheme{
  static Color primaryColor =const Color(0xFF39A552);
  static Color whiteColor =Colors.white;
  static Color blackColor =const Color(0xFF303030);
  static Color redColor =const Color(0xFFC91C22);
  static Color darkBlueColor =const Color(0xFF4F5A69);

  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      foregroundColor: whiteColor,
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35),
        ),
      ),
      centerTitle: true,

    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: whiteColor
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: darkBlueColor
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: blackColor
      ),
    )
  );
}