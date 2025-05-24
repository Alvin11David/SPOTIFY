import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
class AppTheme {

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    ScaffoldBackgroundColor: AppColors.lightBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )
      )
    )
  );
}