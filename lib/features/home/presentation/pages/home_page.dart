import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:folder_structure/app/routes/app_routes.dart';
import 'package:folder_structure/features/auth/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (isPopGesture, result) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAllNamed(AppRoutes.login);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Home!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Obx(() {
                final user = authController.currentUser.value;
                final email =
                    user?.email ?? FirebaseAuth.instance.currentUser?.email;
                return Text("User: ${email ?? 'Unknown'}");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
