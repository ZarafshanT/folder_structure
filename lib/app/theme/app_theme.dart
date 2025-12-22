import 'package:flutter/material.dart';
import 'package:folder_structure/app/theme/app_color_schemes.dart';
import 'custom_theme_components/appbar_theme.dart';
import 'custom_theme_components/bottomsheet_theme.dart';
import 'custom_theme_components/checkbox_theme.dart';
import 'custom_theme_components/elevated_button_theme.dart';
import 'custom_theme_components/outlined_button_theme.dart';
import 'custom_theme_components/text_theme.dart';
import 'custom_theme_components/textformfield_theme.dart';

// class TAppTheme {
//   TAppTheme._();

//   /// Light Theme
//   static ThemeData lightTheme = ThemeData(
//     useMaterial3: true,
//     fontFamily: 'Poppins',
//     brightness: Brightness.light,
//     primaryColor: Colors.blue,
//     textTheme: TTextTheme.lightTextTheme,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: TAppBarTheme.lightAppBarTheme,
//     checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
//    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
//     elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
//     outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
//     inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
//   );

//   /// Dark Theme
//   static ThemeData darkTheme = ThemeData(
//     useMaterial3: true,
//     fontFamily: 'Poppins',
//     brightness: Brightness.dark,
//     primaryColor: Colors.blue,
//     textTheme: TTextTheme.darkTextTheme,
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: TAppBarTheme.darkAppBarTheme,
//     checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
//     bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
//     elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
//     outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
//     inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
//   );
// }

class TAppTheme {
  TAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorScheme: AppColorSchemes.lightColorScheme,
    textTheme: TTextTheme.lightTextTheme,
    scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.surface,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: AppColorSchemes.darkColorScheme,
    textTheme: TTextTheme.darkTextTheme,
    scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.surface,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
