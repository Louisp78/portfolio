
import 'package:flutter/material.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';

class SkillsLabelSection extends StatelessWidget {
  const SkillsLabelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      widgets: [
        ResponsiveWidget(
          maxWidth: ResponsiveConfig.mobilePortraitMaxWidth,
          widget: SizedBox(
            width: size.width,
            child: Column(
              children: [
                LabelBase(
                  title: "Développement mobile",
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                LabelBase(
                  title: "Développement backend",
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                LabelBase(
                  title: "Design d’application",
                ),
              ],
            ),
          ),
        ),
        ResponsiveWidget(
            minWidth: ResponsiveConfig.mobilePortraitMaxWidth,
            widget: SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  LabelBase(
                    title: "Développement mobile",
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  LabelBase(
                    title: "Développement backend",
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  LabelBase(
                    title: "Design d’application",
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
