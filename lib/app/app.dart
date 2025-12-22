import 'package:flutter/material.dart';
import 'package:folder_structure/app/config.dart';
import 'package:folder_structure/app/routes/app_pages.dart';
import 'package:folder_structure/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'theme/app_theme.dart';
import 'bindings/initial_bindings.dart';
import 'localization/app_translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: AppConfig.defaultLocale,
      fallbackLocale: AppConfig.fallbackLocale,
      supportedLocales: AppConfig.supportedLocales,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: AppConfig.defaultThemeMode,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
