import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Use a reactive variable or just check Get.isDarkMode
  // For simplicity, we just toggle. Since Get.isDarkMode updates automatically.
  
  void toggleTheme() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  // Helper to get current icon
  IconData get themeIcon => Get.isDarkMode ? Icons.light_mode : Icons.dark_mode;
}
