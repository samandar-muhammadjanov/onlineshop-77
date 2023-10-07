import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/constants/app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      foregroundColor: AppColors.blackColor,
    ),
  );
}
