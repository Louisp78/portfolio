import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/about/components/desktop_profile_card.dart';
import 'package:portfolio/screens/about/components/mobile_profile_card.dart';
import 'package:portfolio/themes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    final cv = storageRef.child('cv.pdf').getDownloadURL();
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.05),
        decoration: BoxDecoration(
          color: AppColors.of(context).backColor,
          borderRadius:
              BorderRadius.circular(10),
          boxShadow: [
            baseShadow,
          ],
        ),
        child: Column(
          children: [
            ResponsiveWrapper(
              widgets: [
                ResponsiveWidget(
                    maxWidth: ResponsiveConfig.mobilePortraitMaxWidth,
                    widget: MobileProfileCard(
                      cv: cv,
                    )),
                ResponsiveWidget(
                  minWidth: ResponsiveConfig.mobilePortraitMaxWidth,
                  widget: DesktopProfileCard(
                    cv: cv,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
