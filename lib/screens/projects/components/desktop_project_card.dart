import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/visit_url.dart';

class DesktopProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final List<String>? techImages;
  final String githubLink;
  final String? playLink;

  const DesktopProjectCard({
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
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              image,
              width: ResponsiveConfig.isProjectScreenWidthStep1(context)
                  ? 100
                  : 200,
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
              child: Text(
                description,
                style: AppFonts.of(context).body,
                overflow: TextOverflow.fade,
              )),
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
                  onPress: () => visitUrl(url: githubLink)),
              if (playLink != null) Spacer(),
              if (playLink != null)
                LabelBase(
                    title: "Jouer",
                    onPress: () => visitUrl(url: playLink!)),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        )
      ],
    );
  }
}
