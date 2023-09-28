import 'package:flutter/material.dart';
import 'package:onlineshop_77/assets/assets.dart';
import 'package:onlineshop_77/assets/constants/constants.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: AppAssets.fontFamily,
    scaffoldBackgroundColor: AppConstants.kBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.kWhiteColor,
      elevation: 0,
      foregroundColor: AppConstants.kBlackColor,
    ),
  );
}
