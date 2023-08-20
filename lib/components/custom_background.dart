import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class CustomBackground extends StatelessWidget {
  final Color color;
  final double lightWidth;
  final double lightHeight;
  final Alignment alignment;

  const CustomBackground({super.key,
    required this.color,
    required this.lightWidth,
    required this.lightHeight,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: alignment,
            child: ClipOval(
              child: Container(
                width: lightWidth,
                height: lightHeight,
                color: color,
              ),
            ),
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(
                  width: size.width,
                  height: size.height,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
