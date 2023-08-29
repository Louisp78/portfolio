import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class CustomBackground extends StatelessWidget {
  final Color color;
  final double lightWidth;
  final double lightHeight;
  final Alignment alignment;
  final EdgeInsets? padding;

  const CustomBackground({super.key,
    required this.color,
    required this.lightWidth,
    required this.lightHeight,
    required this.alignment,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Align(
              alignment: alignment,
              child: ClipOval(
                child: Container(
                  width: lightWidth,
                  height: lightHeight,
                  color: color,
                ),
              ),
            ),
          ),
          Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Center(
              child: ClipRect(
                clipBehavior: Clip.none,
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
          ),
        ],
      ),
    );
  }
}
