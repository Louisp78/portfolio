import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/themes.dart';

import 'screens/cover/cover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louis Place | Portfolio',
      theme: themeData,
      home: CoverScreen(),
      debugShowCheckedModeBanner: false,
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
