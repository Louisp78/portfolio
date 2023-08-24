import 'package:flutter/material.dart';
import 'package:portfolio/components/base_button.dart';
import 'package:portfolio/local_strings.dart';
import 'package:portfolio/screens/about/components/contact_section.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/download_file.dart';
import 'package:portfolio/tools/send_email.dart';

class DesktopProfileCard extends StatelessWidget {
  final Future<String> cv;

  const DesktopProfileCard({
    super.key,
    required this.cv,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('lib/assets/images/profile.png'),
            ),
            //Spacer(),
            SizedBox(
              height: size.height * 0.02,
            ),
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
              onPressed: () => sendEmail(email: 'louis.place@epita.fr'),
              title: "Me contacter",
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
                LocalStrings.aboutMe,
                style: AppFonts.of(context).body,
              ),
              //Spacer(),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContactSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
