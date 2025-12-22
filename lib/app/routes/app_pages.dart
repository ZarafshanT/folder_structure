import 'package:folder_structure/app/routes/app_routes.dart';
import 'package:folder_structure/features/settings/presentation/pages/permission_page.dart';
import 'package:folder_structure/features/home/presentation/pages/home_page.dart';
import 'package:folder_structure/features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/bindings/auth_binding.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: AuthBinding(), // Keep Auth binding alive
    ),
    GetPage(name: AppRoutes.permissions, page: () => PermissionsPage()),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpPage(),
      binding: AuthBinding(),
    ),
  ];
}
