import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive_config.dart';

class ResponsiveWidget {
  final int maxWidth;
  final int minWidth;
  final int maxHeight;
  final int minHeight;
  final Widget widget;

  const ResponsiveWidget({
    this.maxWidth = ResponsiveConfig.maxWidth,
    this.minWidth = 0,
    this.maxHeight = ResponsiveConfig.maxHeight,
    this.minHeight = 0,
    required this.widget,
  });
}
