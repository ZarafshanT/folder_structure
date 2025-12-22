import 'package:flutter/material.dart';
import 'package:folder_structure/utils/constants/colors/colors.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    error: AppColors.error,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: AppColors.lightText,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondary,
    onSecondary: Colors.black,
    error: AppColors.error,
    onError: Colors.white,
    surface: AppColors.darkBackground,
    onSurface: AppColors.darkText,
  );
}
