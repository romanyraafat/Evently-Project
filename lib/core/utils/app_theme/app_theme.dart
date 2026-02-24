import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // 🌞 Light Theme
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColors.lightGray),
    primaryColor: AppColors.primary,
    textTheme: TextTheme(
      headlineMedium: Styles.styleBold20.copyWith(color: AppColors.blue),
      headlineLarge: Styles.styleBold20.copyWith(color: AppColors.black),
      headlineSmall: Styles.styleMedium16.copyWith(color: AppColors.black),
      bodyLarge: Styles.styleMedium20.copyWith(color: AppColors.black),
    ),
    scaffoldBackgroundColor: AppColors.lightGray,
  );

  // 🌚 Dark Theme
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryDark),
    primaryColor: AppColors.primaryDark,
    textTheme: TextTheme(
      headlineLarge: Styles.styleBold20.copyWith(color: AppColors.lightGray),
      headlineMedium: Styles.styleBold20.copyWith(color: AppColors.blue),
      headlineSmall: Styles.styleMedium16.copyWith(color: AppColors.lightGray),
      bodyLarge: Styles.styleMedium20.copyWith(color: AppColors.lightGray),
    ),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.dark),
    scaffoldBackgroundColor: AppColors.primaryDark,
  );
}
