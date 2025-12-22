import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // Private constructor

  /// Light Theme Input Decoration
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: 48), // Removed constraint for auto-height
    filled: true,
    fillColor: Color(0xFFF5F5F5), // Grey 100
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    floatingLabelStyle: const TextStyle(
      color: Colors.black, // Primary color or Black
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1.5, color: Colors.blue), // Primary color
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1.5, color: Colors.red),
    ),
  );

  /// Dark Theme Input Decoration
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    // constraints: const BoxConstraints.expand(height: 48),
    filled: true,
    fillColor: Color(0xFF1F1F1F), // Dark container color
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    ),
    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.white70,
    ),
    floatingLabelStyle: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1.5, color: Colors.blue),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1.5, color: Colors.red),
    ),
  );
}
