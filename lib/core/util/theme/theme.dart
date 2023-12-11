import 'package:flutter/material.dart';
import 'package:arabiamusic_app/core/constant/assets.dart';
import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/constant/constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: _appBarTheme,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue[500]!,
      primary: AppColors.blue[500],
      error: Colors.red,
      outline: AppColors.grey[50],
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    fontFamily: AppAssets.fontFamily,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
  );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    toolbarHeight: AppConstants.appBarHeight,
    scrolledUnderElevation: 0,
    color: Colors.white,
    titleSpacing: 20,
  );
}
