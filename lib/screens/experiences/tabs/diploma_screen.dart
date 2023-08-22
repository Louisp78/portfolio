import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/dto/diploma_dto.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/experiences/components/diploma_card.dart';

class DiplomaScreen extends StatelessWidget {
  final List<DiplomaDTO> diplomas;

  const DiplomaScreen({super.key, required this.diplomas});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      widgets: [
        ResponsiveWidget(
          minWidth: ResponsiveConfig.mobilePortraitMaxWidth,
          widget: GridView.builder(
              itemCount: diplomas.length,
              itemBuilder: (context, index) {
                return DiplomaCard(
                  diploma: diplomas[index],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.02,
                mainAxisSpacing: size.width * 0.02,
                childAspectRatio: ResponsiveConfig.isExperienceScreenWidthStep1(context) ? 2 : 3,
              )),
        ),
        ResponsiveWidget(
          maxWidth: ResponsiveConfig.mobilePortraitMaxWidth,
          widget: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Padding(
                  padding:  EdgeInsets.only(bottom: size.height * 0.02),
                  child: DiplomaCard(
                    diploma: diplomas[index],
                  ),
                ),
              );
            },
            itemCount: diplomas.length,
          ),
        ),
      ],
    );
  }
}
