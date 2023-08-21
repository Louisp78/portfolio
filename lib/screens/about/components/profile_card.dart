import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/base_button.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/download_file.dart';
import 'package:portfolio/tools/send_email.dart';

import 'contact_section.dart';

import 'dart:html' as html;

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});


  setCardHeight(BuildContext context){
    if (ResponsiveConfig.isAboutScreenWidthStep2(context)){
      return MediaQuery.of(context).size.height * 0.74;
    }
    else if (ResponsiveConfig.isAboutScreenWidthStep1(context)){
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
        height: setCardHeight(context) ,
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

class DesktopProfileCard extends StatelessWidget {
  final Future<String> cv;

  const DesktopProfileCard({
    super.key,
    required this.cv,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('lib/assets/images/profile.png'),
              ),
              Spacer(),
              BaseButton(
                title: "Voir mon CV",
                onPressed: () async {
                  downloadFile(await cv);
                },
              ),
              ResponsiveWrapper(
                widgets: [
                  ResponsiveWidget(
                    maxWidth: ResponsiveConfig.aboutScreenWidthStep1,
                    widget: Column(children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      BaseButton(
                        onPressed: () =>
                            sendEmail(email: 'louis.place@epita.fr'),
                        title: "Me contacter",
                        color: AppColors.of(context).secondaryColor,
                      )
                    ]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Louis Place',
                  style: AppFonts.of(context).title,
                ),
                Text(
                  'Etudiant à EPITA en BAC+5, majeure multimédia et technologies de l’information.\n',
                  style: AppFonts.of(context).body,
                ),
                Text(
                  'Salut ! Je suis un développeur frontend et backend en freelance. Egalement étudiant à EPITA n’hésitez pas à consulter mon CV pour plus d’infos.',
                  style: AppFonts.of(context).body,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ContactSection(),
                      ResponsiveWrapper(widgets: [
                        ResponsiveWidget(
                          minWidth: ResponsiveConfig.aboutScreenWidthStep1,
                          widget: BaseButton(
                            onPressed: () =>
                                sendEmail(email: 'louis.place@epita.fr'),
                            title: "Me contacter",
                            color: AppColors.of(context).secondaryColor,
                          ),
                        )
                      ]),
                    ],
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

class MobileProfileCard extends StatelessWidget {
  final Future<String> cv;

  const MobileProfileCard({super.key, required this.cv});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: ResponsiveConfig.isAboutScreenWidthStep3(context) ? 50 : 90,
            backgroundImage: AssetImage('lib/assets/images/profile.png'),
          ),
          Text(
            'Louis Place',
            style: AppFonts.of(context).title,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          ResponsiveWrapper(
            widgets: [
              ResponsiveWidget(
                minHeight: ResponsiveConfig.aboutScreenHeightStep1,
                widget: Column(
                  children: [
                    Text(
                      'Etudiant à EPITA en BAC+5, majeure multimédia et technologies de l’information.',
                      style: AppFonts.of(context).body,
                    ),
                    Text(
                      'Salut ! Je suis un développeur frontend et backend en freelance. Egalement étudiant à EPITA n’hésitez pas à consulter mon CV pour plus d’infos.',
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
                      ContactSection(),
                      Spacer(),
                      Column(
                        children: [
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
                      ),
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
      ),
    );
  }
}
