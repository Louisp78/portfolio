import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_background.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
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
          ResponsiveWrapper(
            widgets: [
              ResponsiveWidget(
                  maxWidth: ResponsiveConfig.coverScreenWidthStep2,
                  widget:
               CustomBackground(
              alignment: Alignment.center,
              color: AppColors.of(context).secondaryVariantColor,
              lightWidth: 200,
              lightHeight: 200,
                 padding: EdgeInsets.only(top: size.height * 0.2),
            ),
              ),
              ResponsiveWidget(
                maxWidth: ResponsiveConfig.coverScreenWidthStep1,
                minWidth: ResponsiveConfig.coverScreenWidthStep2,
                  widget:
                     CustomBackground(
              alignment: Alignment.center,
              color: AppColors.of(context).secondaryVariantColor,
              lightWidth: 300,
              lightHeight: 300,
                       padding: EdgeInsets.only(top: size.height * 0.2),
            ),
              ),
              ResponsiveWidget(
                minWidth: ResponsiveConfig.coverScreenWidthStep1,
                widget:
                  CustomBackground(
              alignment: Alignment.center,
              color: AppColors.of(context).secondaryVariantColor,
              lightWidth: 400,
              lightHeight: 400,
                    padding: EdgeInsets.only(top: size.height * 0.2),
            ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Column(
                children: [
                  Text(
                    'Portfolio',
                    style: AppFonts.of(context).bigTitle,
                    textAlign: TextAlign.center,
                  ),
                  Text('Freelance développeur web & mobile',
                      style: AppFonts.of(context).subTitle, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.2),
            child: Center(
              child: ResponsiveWrapper(
                widgets: [
                  ResponsiveWidget(
                    maxWidth: ResponsiveConfig.coverScreenWidthStep1,
                      widget:
                      Image.asset("lib/assets/images/lotus.png", width: 90),
                  ),
                  ResponsiveWidget(
                    maxWidth: ResponsiveConfig.mobilePortraitMaxWidth,
                    minWidth: ResponsiveConfig.coverScreenWidthStep1,
                    widget:
                        Image.asset("lib/assets/images/lotus.png", width: 120),
                  ),
                  ResponsiveWidget(
                    minWidth: ResponsiveConfig.mobilePortraitMaxWidth,
                    widget:
                        Image.asset("lib/assets/images/lotus.png", width: 175),
                  ),
                ],
              ),
            ),
          ),
          // Row of containers
          Positioned(
            bottom: size.height * 0.03,
            child: Column(
              children: [
                // set height to min height of child content
                SizedBox(
                  height: ResponsiveConfig.isCoverScreenHeightStep1(context)
                      ? size.height * 0.03
                      : size.height * 0.07,
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
