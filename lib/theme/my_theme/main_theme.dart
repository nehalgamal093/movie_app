import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
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
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 36,
            color: textColor
          ),
          titleMedium: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: textColor
          ),
        ),
      );
}
