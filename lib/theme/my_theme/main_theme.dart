import 'package:flutter/material.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/theme/my_theme/base_theme.dart';

class MainTheme extends BaseTheme {
  @override
  Color get background => ColorManager.blackColor;

  @override
  Color get primaryColor => ColorManager.primaryColor;

  @override
  Color get textColor => ColorManager.whiteColor;

  @override
  ThemeData get myThemeData => ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
          backgroundColor: background,
          iconTheme: IconThemeData(color: ColorManager.primaryColor),
          titleTextStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: ColorManager.primaryColor),
          centerTitle: true),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 36,
            color: textColor),
        titleMedium: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: textColor),
        bodyMedium: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: textColor),
        bodySmall: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: textColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorManager.darkGreyColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.darkGreyColor));
}
