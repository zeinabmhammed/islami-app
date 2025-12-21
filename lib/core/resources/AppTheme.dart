import 'package:flutter/material.dart';
import 'package:islami/core/resources/AppColors.dart';

class AppTheme {
  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark( primary: AppColors.gold),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: "Janna LT",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.gold,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.gold),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.gold,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: "Janna LT",
        letterSpacing: 0,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      selectedIconTheme: IconThemeData(color: AppColors.white, size: 33),
      unselectedIconTheme: IconThemeData(color: AppColors.black, size: 27),
      selectedLabelStyle: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        fontFamily: "Janna LT",
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
        fontFamily: "Janna LT",
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
