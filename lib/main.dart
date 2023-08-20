import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/screens/about/about_screen.dart';
import 'package:portfolio/screens/experiences/experiences_screen.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';

import 'package:portfolio/themes.dart';
import 'screens/cover/cover_screen.dart';
import 'firebase_options.dart';


Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CarouselController controller;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Louis Place | Portfolio',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CarouselSlider(
          carouselController: controller,
         options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: false,
            scrollDirection: Axis.vertical,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
         ),
         items: [
            CoverScreen(),
            AboutScreen(),
            ProjectScreen(),
            ExperiencesScreen(),
          ],
        )
      )
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
