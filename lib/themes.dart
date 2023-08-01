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
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle title = TextStyle(
    fontFamily: 'NeueKonstantGrotesk',
    fontSize: 60,
    fontWeight: FontWeight.w400,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle body = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );

  late TextStyle button = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );
  late TextStyle label = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.of(context).oppositeBaseColor,
    fontStyle: FontStyle.normal,
  );



}

class AppColors {
  late final Color oppositeBaseColor;
  late final Color baseColor;

  AppColors() : oppositeBaseColor = const Color(0x0ff00000);
  AppColors.of(BuildContext context){
    final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
    bool isDark = brightnessValue == Brightness.dark;
    oppositeBaseColor = isDark ? Colors.black : Colors.white;
    baseColor = isDark ? Colors.white : Colors.black;
  }

   Color primaryColor = Color(0xff9739D5);
   Color secondaryColor = Color(0xff82BBEF);
   Color backColor = Color(0xffFEFEFE);
   Color subTextColor = Color(0xff505050);
   LabelColors labelColors = LabelColors();
}


final ThemeData themeData = ThemeData(
    fontFamily: 'Inter',
);