import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xFF004182);
  static ThemeData appTheme = ThemeData(
      primaryColor: primaryColor,
      textTheme: TextTheme(
          titleLarge: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontFamily: "Poppins"),
          titleMedium: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins",
              color: primaryColor),
          bodyLarge: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              fontFamily: "Poppins",
              color: Colors.white),
          bodyMedium: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              fontFamily: "Poppins",
              color: Colors.white),
          bodySmall: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              fontFamily: "Poppins",
              color: Colors.white),
          labelMedium: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: "Poppins",
              color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF004182),
      ));
}
