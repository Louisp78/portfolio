import 'package:flutter/material.dart';
@immutable
class LabelColors {
  static const Color cdi = Color(0xffF7D698);
  static const Color internship = Color(0xff2B94F4);
  static const Color volunteering = Color(0xffB1F0B4);
}


class AppFonts {

  final BuildContext context;
  AppFonts.of(this.context);

  late TextStyle bigTitle = TextStyle(
    fontFamily: 'NeueKonstantGrotesk',
    fontSize: 96,
    fontWeight: FontWeight.w400,
    color: AppColors.of(context).textColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle title = TextStyle(
    fontFamily: 'NeueKonstantGrotesk',
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: AppColors.of(context).textColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).textColor,
    fontStyle: FontStyle.normal,
  );

  late TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.of(context).textColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).textColor,
    fontStyle: FontStyle.normal,
  );



}

class AppColors {
  late final Color textColor;

  AppColors() : textColor = const Color(0x0ff00000);
  AppColors.of(BuildContext context){
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    textColor = isDark ? Colors.black : Colors.white;
  }

  static const Color primaryColor = Color(0xff9739D5);
  static const Color secondaryColor = Color(0xff82BBEF);
  static const Color backColor = Color(0xffFEFEFE);
  static const Color subTextColor = Color(0xff505050);
  static LabelColors labelColors = LabelColors();
}


final ThemeData themeData = ThemeData(
    fontFamily: 'Inter',
);