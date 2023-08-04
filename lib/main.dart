import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:portfolio/themes.dart';
import 'screens/cover/cover_screen.dart';
import 'firebase_options.dart';


Future<void> main() async {
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
