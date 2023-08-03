import 'package:flutter/material.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/components/wheel_navigator.dart';
import 'package:portfolio/navigation/slide_down_animation.dart';
import 'package:portfolio/screens/experiences/experiences_screen.dart';
import 'package:portfolio/screens/projects/projects_screen.dart';
import 'package:portfolio/themes.dart';
import 'components/profile_card.dart';

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
          ProfileCard(),
          Spacer(
            flex: 2,
          ),
          Spacer(),
        ]),
      )),
    );
  }

}





