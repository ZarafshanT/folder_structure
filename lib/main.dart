import 'package:flutter/material.dart';
import 'package:folder_structure/app/app.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // 🔹 Lock device orientation (optional)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // 🔹 Run the app
  runApp(const MyApp());
}
