import 'package:flutter/material.dart';
import '../../../../utils/constants/colors/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // Private constructor

  /// Light Theme Input Decoration
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.darkGrey,
    suffixIconColor: AppColors.darkGrey,
    filled: true,
    fillColor: AppColors.white,
    hintStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary,
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.textPrimary,
    ),
    floatingLabelStyle: const TextStyle(
      color: AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.black),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );

  /// Dark Theme Input Decoration
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    filled: true,
    fillColor: AppColors.darkContainer,
    hintStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary,
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      color: AppColors.white,
    ),
    floatingLabelStyle: const TextStyle(
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );
}
