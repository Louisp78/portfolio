import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/themes.dart';

import 'desktop_project_card.dart';

import 'dart:js' as js;

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final List<String> techImages;
  final String githubLink;
  final String? playLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.techImages,
    required this.githubLink,
    this.playLink,
  });

  @override
  Widget build(BuildContext context) {
    List<SvgPicture> generateSvgPicture() {
      final List<SvgPicture> svgPictures = [];
      for (var item in techImages ?? []) {
        svgPictures.add(SvgPicture.asset(
          item,
          width: ResponsiveConfig.isProjectScreenWidthStep1(context) ? 40 : 60,
        ));
      }
      return svgPictures;
    }

    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: Container(
        width: ResponsiveConfig.isProjectScreenWidthStep2(context) ? size.width * 0.8 : size.width * 0.7,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.05),
        decoration: BoxDecoration(
          color: AppColors.of(context).backColor,
        ),
        child: ResponsiveWrapper(
          widgets: [
            ResponsiveWidget(
              minWidth: ResponsiveConfig.projectScreenWidthStep2,
              widget: DesktopProjectCard(
                title: title,
                description: description,
                image: image,
                techImages: techImages,
                githubLink: githubLink,
                playLink: playLink,
              ),
            ),
            ResponsiveWidget(
                maxWidth: ResponsiveConfig.projectScreenWidthStep2,
                widget: Column(
                  children: [
                    Image.asset(
                      image,
                      width: 100,
                    ),
                    SizedBox(width: size.width * 0.05),
                    Text(
                      title,
                      style: AppFonts.of(context).title,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: generateSvgPicture(),
                    ),
                    SizedBox(height: size.height * 0.05),
                    ResponsiveWrapper(
                      widgets: [
                        ResponsiveWidget(
                          minHeight: ResponsiveConfig.projectScreenHeightStep1,
                          widget:
                           SizedBox(
                          width: size.width * 0.6,
                          height: size.height * 0.25,
                          child: Text(
                            description,
                            style: AppFonts.of(context).body,
                            overflow: TextOverflow.fade,
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    LabelBase(
                        title: "Voir le code",
                        onPress: () => js.context.callMethod('open', [githubLink])),
                    if (playLink != null) SizedBox(height: 20),
                    if (playLink != null)
                      LabelBase(
                          title: "Jouer",
                          onPress: () => js.context.callMethod('open', [playLink])),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
