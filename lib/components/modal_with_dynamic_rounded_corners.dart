import 'package:flutter/material.dart';

double getDynamicBorderRadius(BoxConstraints constraints, double borderRadiusPercentage)  {
  double minDimension = constraints.maxWidth < constraints.maxHeight
      ? constraints.maxWidth
      : constraints.maxHeight;
      return minDimension * (borderRadiusPercentage / 100);
}