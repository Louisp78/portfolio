import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';

@immutable
class LabelColors {
  static const Color cdi = Color(0xffF7D698);
  static const Color internship = Color(0xff2B94F4);
  static const Color volunteering = Color(0xffB1F0B4);
}

class AppFonts {
  final BuildContext context;

  AppFonts.of(this.context);

  double bigTitleSetSize() {
    if (ResponsiveConfig.isCoverScreenWidthStep2(context)) {
      return 50;
    } else if (ResponsiveConfig.isCoverScreenWidthStep1(context)) {
      return 70;
    } else {
      return 96;
    }
  }

  double buttonSetSize() {
    if (ResponsiveConfig.isCoverScreenWidthStep2(context)) {
      return 12;
    } else if (ResponsiveConfig.isMobileWidth(context)) {
      return 16;
    } else {
      return 20;
    }
  }

  double titleSetSize() {
    if (ResponsiveConfig.isAboutScreenHeightStep2(context)) {
      return 30;
    } else if (ResponsiveConfig.isMobileWidth(context)) {
      return 40;
    } else {
      return 60;
    }
  }

  double bodySetSize() {
    if (ResponsiveConfig.isMobileWidth(context)) {
      return 16;
    } else {
      return 20;
    }
  }

  late TextStyle bigTitle = TextStyle(
    fontFamily: 'NeueKonstantGrotesk',
    fontSize: bigTitleSetSize(),
    fontWeight: FontWeight.w400,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle title = TextStyle(
    fontFamily: 'NeueKonstantGrotesk',
    fontSize: titleSetSize(),
    fontWeight: FontWeight.w400,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: bodySetSize(),
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );

  late TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: buttonSetSize(),
    fontWeight: FontWeight.w600,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: ResponsiveConfig.isMobileWidth(context) ? 12 : 16,
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
}

class AppColors {
  late final Color oppositeBaseColor;
  late final Color baseColor;

  AppColors() : oppositeBaseColor = const Color(0x0ff00000);

  AppColors.of(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    // TODO: Add dark mode ?
    //bool isDark = brightnessValue == Brightness.dark;
    oppositeBaseColor = Colors.black;
    baseColor = Colors.white;
  }

  Color primaryColor = Color(0xff9739D5);
  Color secondaryColor = Color(0xff1E2068);
  Color secondaryVariantColor = Colors.blue;
  Color backColor = Color(0xffF6F6F6);
  Color subTextColor = Color(0xff505050);
  LabelColors labelColors = LabelColors();
}

final ThemeData themeData = ThemeData(
  fontFamily: 'Inter',
);

const baseShadow = BoxShadow(
  color: Colors.grey,
  offset: Offset(0, 13), // Change the offset to adjust the shadow position
  blurRadius: 34, // Adjust the blurRadius for the intensity of the shadow
  spreadRadius: 0, // Adjust the spreadRadius for the size of the shadow
);

const baseBorderRadiusPercent = 1.3;
