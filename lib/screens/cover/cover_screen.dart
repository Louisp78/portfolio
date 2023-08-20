import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_background.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/components/wheel_navigator.dart';
import 'package:portfolio/screens/about/about_screen.dart';
import 'package:portfolio/themes.dart';

import 'components/custom_divider.dart';

class CoverScreen extends StatefulWidget {
  const CoverScreen({super.key});

  @override
  State<CoverScreen> createState() => _CoverScreenState();
}

class _CoverScreenState extends State<CoverScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
            children: <Widget>[
              CustomBackground(
                alignment: Alignment.center,
                color: AppColors.of(context).secondaryVariantColor,
                lightWidth: 400,
                lightHeight: 400,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.05),
                  child: Text(
                    'Portfolio',
                    style: AppFonts.of(context).bigTitle,
                  ),
                ),
              ),
              Center(
                child: Image.asset("lib/assets/images/lotus.png", width: 175),
              ),
              // Row of containers
              Positioned(
                bottom: 30,
                child: Column(
                  children: [
                    // set height to min height of child content
                    SizedBox(
                      width: size.width,
                      child: Row(
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          LabelBase(
                            title: "Développement mobile",
                            onPress: () {},
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          LabelBase(
                            title: "Développement backend",
                            onPress: () {},
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          LabelBase(
                            title: "Design d’application",
                            onPress: () {},
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Container(
                      child: SizedBox(
                        width: size.width,
                        child: Row(
                          children: [
                            const CustomRowDivider(),
                            Text('Louis Place',
                                style: AppFonts.of(context)
                                    .title
                                    .copyWith(fontSize: 24)),
                            const CustomRowDivider(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
