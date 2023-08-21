import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/themes.dart';

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
          width: 60,
        ));
      }
      return svgPictures;
    }

    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: Container(
        width: size.width * 0.7,
        height: size.height * 0.8,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.05),
        decoration: BoxDecoration(
          color: AppColors.of(context).backColor,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  image,
                  width: 200,
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppFonts.of(context).title,
                    ),
                    Row(
                      children: generateSvgPicture(),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: size.height * 0.05),
           Align(
             alignment: Alignment.centerLeft,
             child: SizedBox(
               width: size.width * 0.6,
                  height: size.height * 0.25,
                  child: Text(description, style: AppFonts.of(context).body, overflow: TextOverflow.fade,)),
           ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  LabelBase(
                      title: "Voir le code",
                      onPress: () =>
                          js.context.callMethod('open', [githubLink])),
                  if (playLink != null)
                    Spacer(),
                  if (playLink != null)
                    LabelBase(
                        title: "Jouer",
                        onPress: () =>
                            js.context.callMethod('open', [playLink])),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
