import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color black = Color(0xff000000);
  static const Color navy = Color(0xff4F5A69);
  static const Color white = Color(0xffffffff);
  static const Color red = Color(0xffC91C22);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: white),
      color: primaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: white,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(22),
          right: Radius.circular(22),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
