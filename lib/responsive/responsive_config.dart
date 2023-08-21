import 'package:flutter/material.dart';

class ResponsiveConfig {
  // max values ========================
  static const maxWidth = 2000;
  static const maxHeight = 2000;


  // Screen config ====================
  static const coverScreenWidthStep1 = 450;
  static const coverScreenWidthStep2 = 340;
  static const coverScreenHeightStep1 = 900;
  static const coverScreenHeightStep2 = 700;

  // ==================================

  static const smallMobileMaxWidth = 359;
  static const mobilePortraitMaxWidth = 850;
  static const tabletPortraitMinWidth = 850;
  static const tabletPortraitMaxWidth = 1100;
  static const desktopPortraitMinWidth = 1100;


  static bool isMobileWidth(BuildContext context) =>
      MediaQuery.of(context).size.width < mobilePortraitMaxWidth;
  static bool isSmallMobileWidth(BuildContext context) =>
      MediaQuery.of(context).size.width < smallMobileMaxWidth;
  static bool isTabletWidth(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletPortraitMinWidth &&
      MediaQuery.of(context).size.width < tabletPortraitMaxWidth;
  static bool isDesktopWidth(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopPortraitMinWidth;
  static bool isCoverScreenWidthStep1(BuildContext context) =>
      MediaQuery.of(context).size.width < coverScreenWidthStep1;
  static bool isCoverScreenHeightStep1(BuildContext context) =>
      MediaQuery.of(context).size.height < coverScreenHeightStep1;
  static bool isCoverScreenWidthStep2(BuildContext context) =>
      MediaQuery.of(context).size.width < coverScreenWidthStep2;
}