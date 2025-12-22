import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceUtils {
  /// Platform checks
  static bool isAndroid() => Platform.isAndroid;

  static bool isIOS() => Platform.isIOS;

  static void setStatusBarColor(Color color, {bool isDark = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  /// Orientation checks
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  /// Keyboard visibility (checks if keyboard is open)
  static bool isKeyboardVisible(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom > 0;

  /// Hide keyboard manually
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Device size
  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  /// Device pixel ratio
  static double devicePixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  /// Device padding (e.g. notch, status bar)
  static EdgeInsets devicePadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  /// Check if device is tablet
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  /// Theme mode (dark/light)
  static bool isDarkMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  /// Check if device has internet connection
  // static Future<bool> isConnectedToInternet() async {
  // final result = await Connectivity().checkConnectivity();
  // return result != ConnectivityResult.none;
  // }
}
