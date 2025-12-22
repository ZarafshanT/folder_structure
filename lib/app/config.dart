import 'package:flutter/material.dart';

class AppConfig {
  // 🔹 App basic info
  static const String appName = 'My App';
  static const String appVersion = '1.0.0';
  static const String appEnv = 'production'; // or staging, dev

  // 🔹 Localization settings
  static const Locale defaultLocale = Locale('en', 'US');
  static const Locale fallbackLocale = Locale('en', 'US');

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ur', 'PK'),
  ];

  // 🔹 Theme settings
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  // 🔹 API settings
  static const String baseApiUrl = 'https://api.example.com';
}
