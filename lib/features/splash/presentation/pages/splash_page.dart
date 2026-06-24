import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    print('SPLASH: initState called');
    _navigateToNext();
  }

  _navigateToNext() async {
    print('SPLASH: _navigateToNext started');
    var currentUser = FirebaseAuth.instance.currentUser;
    print(
      'SPLASH: FirebaseAuth.currentUser before listen = ${currentUser?.uid}',
    );

    currentUser ??= await FirebaseAuth.instance
        .authStateChanges()
        .firstWhere(
          (user) => user != null,
          orElse: () => FirebaseAuth.instance.currentUser,
        )
        .timeout(
          const Duration(seconds: 5),
          onTimeout: () => FirebaseAuth.instance.currentUser,
        );

    print('SPLASH: currentUser after restore = ${currentUser?.uid}');
    final route = currentUser != null ? AppRoutes.home : AppRoutes.login;
    print('SPLASH: routing to $route');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Get.offAllNamed(route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blueAccent),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
