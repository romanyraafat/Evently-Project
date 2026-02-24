import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // 🌞 Light Theme
  static ThemeData lightTheme = ThemeData(

    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      headlineLarge: Styles.styleBold20.copyWith(color: AppColors.black),
    ),
    scaffoldBackgroundColor: AppColors.lightGray,
  );

  // 🌚 Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    textTheme: TextTheme(
      headlineLarge: Styles.styleBold20.copyWith(color: AppColors.lightGray),
    ),

    scaffoldBackgroundColor: AppColors.primaryDark,
  );
}
