import 'package:flutter/material.dart';

import '../constants/app_colors.dart';


class AppTheme {
  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(10, 10, 120, .1),
    100: const Color.fromRGBO(10, 10, 120, .2),
    200: const Color.fromRGBO(10, 10, 120, .3),
    300: const Color.fromRGBO(10, 10, 120, .4),
    400: const Color.fromRGBO(10, 10, 120, .5),
    500: const Color.fromRGBO(10, 10, 120, .6),
    600: const Color.fromRGBO(10, 10, 120, .7),
    700: const Color.fromRGBO(10, 10, 120, .8),
    800: const Color.fromRGBO(10, 10, 120, .9),
    900: const Color.fromRGBO(10, 10, 120, 1),
  };
  static MaterialColor customColor = MaterialColor(0xff0A0A78, colorCodes);

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Rubik",
      primarySwatch: customColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: AppColors.textColor,
      canvasColor: AppColors.canvasColor,
      hintColor: AppColors.red,
      cardColor: AppColors.containerColor,
      dividerColor: AppColors.dividerColor,
      appBarTheme:  AppBarTheme(
        elevation: 0.0,
        color: AppColors.appBarColor,
        iconTheme:  IconThemeData(
          color: AppColors.iconColor,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.iconColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Rubik",
        ),
        centerTitle: true,
      ),
    );
  }
  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      fontFamily: "Rubik",
      primarySwatch: customColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      primaryColor: AppColors.appBarColor,
      hintColor: AppColors.red,
      canvasColor: Colors.black,
      cardColor: AppColors.darkContainerColor,
      dividerColor: AppColors.darkContainerColor,
      splashColor: Colors.grey.withOpacity(.01),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle:
        TextStyle(color: Colors.white30, fontWeight: FontWeight.w500),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: AppColors.mainColor,
          ),
        ),
      ),
      appBarTheme:  const AppBarTheme(
        elevation: 0.0,
        color: AppColors.darkBackgroundColor,
        iconTheme: IconThemeData(
          color: AppColors.appBarColor,
        ),
        titleTextStyle: TextStyle(
          color: AppColors.appBarColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: "Rubik",
        ),
        centerTitle: true,
      ),
    );
  }
}