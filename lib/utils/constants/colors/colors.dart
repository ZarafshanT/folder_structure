import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor
  static const Color primary = Color(0xFF1565C0);
  static const Color secondary = Color(0xFF42A5F5);

  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;

  static const Color lightBackground = Colors.white;
  static const Color lightText = Colors.black87;
  static const Color lightAppBar = Color(0xFFF5F5F5);

  static const Color darkBackground = Color(0xFF121212);
  static const Color darkText = Colors.white;
  static const Color darkAppBar = Color(0xFF1F1F1F);
  static final AppColors instance = AppColors._();

  static const Color accent = Color(0xFFFFC107); // Example accent color

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.black87;
  static const Color textHint = Colors.grey;

  static const Color background = Color(0xFFF5F5F5);

  // Linear Gradient examples
  static const LinearGradient mainGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [accent, primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Add more colors or gradients as needed
}
