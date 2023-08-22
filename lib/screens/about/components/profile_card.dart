import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/base_button.dart';
import 'package:portfolio/local_strings.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/about/components/desktop_profile_card.dart';
import 'package:portfolio/screens/about/components/mobile_profile_card.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/download_file.dart';
import 'package:portfolio/tools/send_email.dart';

import 'contact_section.dart';

import 'dart:html' as html;

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  setCardHeight(BuildContext context) {
    if (ResponsiveConfig.isAboutScreenWidthStep2(context)) {
      return MediaQuery.of(context).size.height * 0.74;
    } else if (ResponsiveConfig.isAboutScreenWidthStep1(context)) {
      return MediaQuery.of(context).size.height * 0.8;
    } else {
      return MediaQuery.of(context).size.height * 0.6;
    }
  }

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    final cv = storageRef.child('cv.pdf').getDownloadURL();
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.05),
        width: size.width * 0.9,
        height: setCardHeight(context),
        decoration: BoxDecoration(
          color: AppColors.of(context).backColor,
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
