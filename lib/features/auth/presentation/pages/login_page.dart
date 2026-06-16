import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors/colors.dart';
import '../controllers/auth_controller.dart';
import '../../../../app/routes/app_routes.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../app/theme/theme_controller.dart';
import '../widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller = Get.find<AuthController>();
  // Simple dependency injection for ThemeController.
  // In a real app, bind this in InitialBindings or AuthBindings.
  final ThemeController themeController = Get.put(ThemeController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme data is now fully centrally managed.
    // We just access it to ensure specific text styles match our hierarchy.
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => themeController.toggleTheme(),
            icon: Icon(
              // We need to use Obx or GetBuilder if we want the icon to change *instantly*
              // if Get.isDarkMode wasn't reactive enough (it is usually updated with theme change).
              // However, since Get.changeThemeMode rebuilds the tree, the build method runs again
              // and checks themeController logic.
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
      // Background color is handled by theme automatically
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... existing children ...
                  // Since I have to replace the whole file content to be safe with tool limitations, I will copy the children logic.
                  Text('Welcome Back', style: theme.textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to your account',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.textTheme.bodyLarge?.color?.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!GetUtils.isEmail(value.trim())) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          prefixIcon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => controller.errorMessage.value.isEmpty
                              ? const SizedBox.shrink()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    controller.errorMessage.value,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.error,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.login(
                                          emailController.text.trim(),
                                          passwordController.text,
                                        );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(),
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: AppColors.white,
                                    )
                                  : const Text(
                                      'Login',
                                      //textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Register Button
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signup);
                      },
                      child: const Text("Don't have an account? Sign Up"),
                      // Style is now handled by TextButtonTheme
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: theme.colorScheme.outlineVariant),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: theme.colorScheme.outlineVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialButton(
                        icon: Icons.g_mobiledata, // Placeholder
                        label: 'Google',
                        onTap: () => controller.loginWithGoogle(),
                        color: AppColors
                            .lightContainer, // Or brand color background
                        textColor: AppColors.google, // Brand color text
                      ),
                      SocialButton(
                        icon: Icons.facebook,
                        label: 'Facebook',
                        onTap: () => controller.loginWithFacebook(),
                        color: AppColors.lightContainer,
                        textColor: AppColors.facebook,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
