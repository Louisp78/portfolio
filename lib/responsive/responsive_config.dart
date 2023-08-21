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
  // About Screen
  static const aboutScreenWidthStep1 = 1000;
  static const aboutScreenWidthStep2 = 540;
  static const aboutScreenWidthStep3 = 376;
  static const aboutScreenHeightStep1 = 800;
  static const aboutScreenHeightStep2 = 600;
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
  static bool isAboutScreenWidthStep1(BuildContext context) =>
      MediaQuery.of(context).size.width < aboutScreenWidthStep1;

  static bool isAboutScreenWidthStep2(BuildContext context) =>
      MediaQuery.of(context).size.width < aboutScreenWidthStep2;
  static bool isAboutScreenHeightStep1(BuildContext context) =>
      MediaQuery.of(context).size.height < aboutScreenHeightStep1;
  static bool isAboutScreenHeightStep2(BuildContext context) =>
      MediaQuery.of(context).size.height < aboutScreenHeightStep2;
  static bool isAboutScreenWidthStep3(BuildContext context) =>
      MediaQuery.of(context).size.width < aboutScreenWidthStep3;
}