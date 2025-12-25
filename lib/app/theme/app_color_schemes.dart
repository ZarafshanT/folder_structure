import 'package:flutter/material.dart';
import '../../../../utils/constants/colors/colors.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.light,
    onSurface: AppColors.textPrimary,
    outline: AppColors.grey,
    outlineVariant: AppColors.grey,
    onSurfaceVariant: AppColors.textSecondary,
    background: AppColors.light,
    onBackground: AppColors.textPrimary,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.black,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.dark,
    onSurface: AppColors.white,
    outline: AppColors.darkGrey,
    outlineVariant: AppColors.darkerGrey,
    onSurfaceVariant: AppColors.textWhite, // Used for hint/secondary text
    background: AppColors.dark,
    onBackground: AppColors.white,
  );
}
