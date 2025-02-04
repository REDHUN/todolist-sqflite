import 'package:flutter/material.dart';
import 'package:todoapp/features/application/services/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      selectedLabelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'poppins',
    brightness: Brightness.dark,
    primaryColor: AppColor.bgColor,
    scaffoldBackgroundColor: AppColor.bgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.appBarColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey.shade600,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      selectedLabelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
