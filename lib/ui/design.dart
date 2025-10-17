import 'package:flutter/material.dart';

class AppColors {
  static const Color gold = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF707070);
  static const Color offWhite = Color(0xFFEBEBEB);
}

class AppImages {
  static const String icHadeth = "assets/svg/ic_hadeth.svg";
  static const String icQuran = "assets/svg/ic_quran.svg";
  static const String icRadio = "assets/svg/ic_radio.svg";
  static const String icsebha = "assets/svg/ic_sebha.svg";
  static const String icTime = "assets/svg/ic_time.svg";
  static const String icSearch = "assets/svg/search_ic.svg";
  static const String icChapter = "assets/svg/ic_chapter.svg";

  static const String splashBackground = "assets/images/splash_background.png";
  static const String splashIslami = "assets/images/splash1_logo.png";
  static const String splashUp = "assets/images/splash1Decoration.png";
  static const String splashDown = "assets/images/splashDownDecoration.png";
  static const String splashGlow = "assets/images/splashGlow.png";
  static const String splashTop = "assets/images/splashAppbar.png";
  static const String splashTwo = "assets/images/splash2.png";

  static const String introScreen = "assets/images/introScreen1.png";
  static const String introScreen2 = "assets/images/introScreen2.png";
  static const String introScreen3 = "assets/images/introScreen3.png";
  static const String introScreen4 = "assets/images/introScreen4.png";
  static const String introScreen5 = "assets/images/introScreen5.png";

  static const String icLeft = "assets/images/leftDecoration.png";
  static const String icRight = "assets/images/rightDecoration.png";
  static const String icBottomDecoration = "assets/images/bottomDecoration.png";
  static const String defaultBackground = "assets/images/Background3.jpg";
  static const String islamiLogo = "assets/images/islami_logo.png";
  static const String sebhaHead = "assets/images/sebha_head.png";
  static const String sebhaBody = "assets/images/SebhaBody.png";
  static const String sebhaBackground = "assets/images/SebhaBackground.png";

  static const String hadethBackground="assets/images/hadethBackground.png";
}

class AppTheme {
  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(primary: AppColors.gold),
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
