import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/base_button.dart';
import 'package:portfolio/themes.dart';

import 'contact_section.dart';

import 'dart:html' as html;


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
    final cv = storageRef.child('cv.pdf').getDownloadURL();
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05, vertical: size.height * 0.05),
      width: size.width * 0.9,
      height: size.height * 0.6,
      decoration: BoxDecoration(
        color: AppColors.of(context).backColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          AssetImage('lib/assets/images/profile.png'),
                    ),
                    Spacer(),
                    BaseButton(
                      title: "Voir mon CV",
                      onPressed: () async {
                        downloadFile(await cv);
                      },
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
                          child: ContactSection()),
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
  void downloadFile(String url) {
    html.AnchorElement anchorElement =  new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
}
