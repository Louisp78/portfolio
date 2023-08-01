import 'package:flutter/material.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/screens/cover/cover_screen.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';
import 'package:portfolio/themes.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WheelNavigator(
      nextPage: ProjectScreen(),
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'Qui suis-je ?',
            style: AppFonts.of(context)
                .title
                .copyWith(color: AppColors.of(context).subTextColor),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.height * 0.05),
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.of(context).backColor,
            ),
            child: Column(
              children: [
                Row(
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
                        BaseButton(
                          title: "Voir mon CV",
                          onPressed: () {},
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
                          SizedBox(
                            height: 25,
                          ),
                          ContactSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LabelBase(title: 'Projects'),
              LabelBase(title: 'Experiences'),
            ],
          ),
          Spacer(),
        ]),
      )),
    );
  }
}

class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const BaseButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppFonts.of(context)
              .body
              .copyWith(color: AppColors.of(context).baseColor),
        ),
      ),
    );
  }
}

class ContactPart extends StatelessWidget {
  final String name;
  final String value;

  const ContactPart({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$name ",
        style: AppFonts.of(context).label.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: value,
            style: AppFonts.of(context).label,
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactPart(name: 'Localisation :', value: 'Paris, France'),
        ContactPart(name: 'Email :', value: 'louis.place@epita.fr'),
        ContactPart(name: 'Téléphone :', value: '+33 6 00 00 00 00'),
        ContactPart(name: 'Github:', value: 'github.com/Louisp78'),
        ContactPart(name: 'Linkedin :', value: 'linkedin.com/in/louis-place'),
      ],
    );
  }
}
