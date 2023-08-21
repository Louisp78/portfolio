import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_background.dart';
import 'package:portfolio/components/wheel_navigator.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';
import 'package:portfolio/themes.dart';
import 'components/profile_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          CustomBackground(
              alignment: ResponsiveConfig.isMobileWidth(context)
                  ? Alignment.bottomCenter
                  : Alignment.topRight,
              color: AppColors.of(context).secondaryVariantColor,
              lightWidth: 400,
              lightHeight: 400),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Qui suis-je ?',
                style: AppFonts.of(context)
                    .title
                    .copyWith(color: AppColors.of(context).subTextColor),
              ),
              Spacer(),
              ProfileCard(),
              Spacer(
                flex: 2,
              ),
              Spacer(),
            ]),
          ),
        ],
      ),
    );
  }
}

class LeftLightBackground extends StatelessWidget {
  const LeftLightBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ClipOval(
              child: Container(
                width: 400,
                height: 400,
                color: AppColors.of(context).secondaryVariantColor,
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
