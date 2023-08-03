
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:portfolio/themes.dart';

import 'screens/cover/cover_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async {
  await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: "lib/.env");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louis Place | Portfolio',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const CoverScreen(),
    );
  }
}

class BaseLayout extends StatelessWidget {
  final Widget child;
  final Widget? floatingActionButton;

  const BaseLayout({
    super.key,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: child,
    );
  }
}
