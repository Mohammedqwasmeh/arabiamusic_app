import 'package:arabiamusic_app/core/constant/assets.dart';
import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/constant/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    appBarTheme: _appBarTheme,
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.pink[500]!,
      primary: AppColors.pink[500],
      brightness: Brightness.dark,
    ),
    fontFamily: AppAssets.fontFamily,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.grey[500],
  );

  static final AppBarTheme _appBarTheme = AppBarTheme(
    toolbarHeight: AppConstants.appBarHeight,
    scrolledUnderElevation: 0,
    color: AppColors.grey[500],
    titleSpacing: 20,
  );
}
