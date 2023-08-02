import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/wheel_navigator.dart';

import 'components/project_card.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WheelNavigator(
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.8,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 2.0,
              ),
              items: const [
                 ProjectCard(title: "SudoSumo",image: "lib/assets/images/sudosumo_logo.png", description:
                    'SudoSumo est une application mobile de gestion de tournois de sumo. Elle permet de gérer les combats, les participants, les équipes et les tournois. Elle est disponible sur Android et iOS.',
                  githubLink: "https://github.com/Louisp78/sudosumo",
                  techImages: [
                    "lib/assets/images/react_logo.svg",
                    "lib/assets/images/ts_logo.svg",
                  ],
                  playLink: "https://louisp78.github.io/sudosumo/",
                ),
                ProjectCard(
                  title: "Pokeutils",
                  description: "Pokeutils est une application mobile de gestion de tournois de sumo. Elle permet de gérer les combats, les participants, les équipes et les tournois. Elle est disponible sur Android et iOS.",
                  techImages: [
                    "lib/assets/images/python_logo.svg",
                  ],
                  githubLink: "https://github.com/Louisp78/Pokeutils",
                  image: "lib/assets/images/pokeutils_logo.png",
                ),
                ProjectCard(
                  image: "lib/assets/images/testmaster.png",
                  title: "TestMaster",
                  description: "TestMaster est une application mobile de gestion de tournois de sumo. Elle permet de gérer les combats, les participants, les équipes et les tournois. Elle est disponible sur Android et iOS.",
                  techImages: [
                    "lib/assets/images/python_logo.svg",
                  ],
                  githubLink: "https://github.com/Louisp78/TestMaster",
                ),
              ],
            ),
            Spacer()
            /*ListView.builder(itemBuilder: (context, index) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }, itemCount: 3,),*/
          ],
        ),

      ),
    );
  }
}
