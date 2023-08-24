import 'package:flutter/material.dart';
import 'package:portfolio/components/base_button.dart';
import 'package:portfolio/local_strings.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/about/components/contact_section.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/download_file.dart';
import 'package:portfolio/tools/send_email.dart';

class MobileProfileCard extends StatelessWidget {
  final Future<String> cv;

  const MobileProfileCard({super.key, required this.cv});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CircleAvatar(
          radius: ResponsiveConfig.isUnderWidth(context, 445) ? 50 : 90,
          backgroundImage: AssetImage('lib/assets/images/profile.png'),
        ),
        Text(
          'Louis Place',
          style: AppFonts.of(context).title,
          textAlign: TextAlign.center,
        ),
        ResponsiveWrapper(
          widgets: [
            ResponsiveWidget(
              minHeight: ResponsiveConfig.aboutScreenHeightStep1,
              widget: Column(
                children: [
                  Text(
                    LocalStrings.aboutMe,
                    style: AppFonts.of(context).body,
                  ),
                ],
              ),
            ),
          ],
        ),
        ResponsiveWrapper(
          widgets: [
            ResponsiveWidget(
              minWidth: ResponsiveConfig.aboutScreenWidthStep2,
              widget: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Column(
                      children: [
                        BaseButton(
                          title: "Voir mon CV",
                          color: AppColors.of(context).secondaryColor,
                          onPressed: () async {
                            downloadFile(await cv);
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        BaseButton(
                          onPressed: () =>
                              sendEmail(email: 'louis.place@epita.fr'),
                          title: "Me contacter",
                        ),
                      ],
                    ),
                    Spacer(),
                    ContactSection(),
                  ],
                ),
              ),
            ),
            ResponsiveWidget(
                maxWidth: ResponsiveConfig.aboutScreenWidthStep2,
                widget: Column(
                  children: [
                    ContactSection(
                      isCentered: true,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    BaseButton(
                      title: "Voir mon CV",
                      onPressed: () async {
                        downloadFile(await cv);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    BaseButton(
                      onPressed: () =>
                          sendEmail(email: 'louis.place@epita.fr'),
                      title: "Me contacter",
                      color: AppColors.of(context).secondaryColor,
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
