import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/wheel_navigator.dart';
import 'package:portfolio/themes.dart';

import 'components/project_card.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int _currentIndex = 0;
  late CarouselController controller;

  @override
  void initState() {
    controller = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return WheelNavigator(
      child: Scaffold(
        body: Column(
          children: [
            Spacer(),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.15),
                  child: Text(
                    "Mes projets",
                    style: AppFonts
                        .of(context)
                        .title
                        .copyWith(color: AppColors
                        .of(context)
                        .subTextColor),
                  ),
                )),
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
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
              carouselController: controller,
              items: const [
                ProjectCard(
                  title: "SudoSumo",
                  image: "lib/assets/images/sudosumo_logo.png",
                  description:
                  "Bienvenue dans l'univers de SudoSumo, une application de Sudoku complète qui saura vous séduire par ses multiples fonctionnalités. Que vous soyez novice ou expert du Sudoku, SudoSumo vous garantit une expérience de jeu inégalée et des défis à la hauteur de vos attentes.\n\nPlongez dans l'univers captivant du Sudoku grâce à une interface conviviale et des graphismes attrayants. Choisissez parmi différents niveaux de difficulté, allant du facile au diaboliquement difficile, pour mettre votre esprit à l'épreuve et améliorer vos compétences de résolution de problèmes.\n\nEn cas de blocage, SudoSumo dispose d'un solveur avancé intégré, qui fait appel à plusieurs algorithmes de résolution de Sudoku connus. Grâce à ses techniques de backtracking, de recherche de possibilités et bien d'autres stratégies, il vous permettra de trouver la solution rapidement.",
                  githubLink: "https://github.com/Louisp78/sudosumo",
                  techImages: [
                    "lib/assets/images/react_logo.svg",
                    "lib/assets/images/ts_logo.svg",
                  ],
                  playLink: "https://louisp78.github.io/sudosumo/",
                ),
                ProjectCard(
                  title: "Pokeutils",
                  description:
                  """Bienvenue dans Pokeutils, un outil Pokemon conçu pour calculer les PV perdus et l'efficacité des types lors des combats. Réalisé avec amour en Python, Pokeutils est le compagnon ultime pour les dresseurs cherchant à prendre l'avantage dans leurs combats Pokemon.
                  
Avec Pokeutils, vous pouvez facilement déterminer la quantité de PV perdue par votre Pokemon après chaque attaque ou échange. Il fournit des calculs précis et efficaces pour vous aider à élaborer des stratégies et à prendre des décisions éclairées lors de combats intenses.

De plus, Pokeutils propose un calculateur d'efficacité des types, vous permettant d'évaluer les forces et les faiblesses des mouvements de votre Pokemon contre différentes natures. Cette fonctionnalité précieuse vous aide à exploiter les faiblesses de vos adversaires et à renforcer vos chances de victoire.
                  """,
                  techImages: [
                    "lib/assets/images/python_logo.svg",
                  ],
                  githubLink: "https://github.com/Louisp78/Pokeutils",
                  image: "lib/assets/images/pokeutils_logo.png",
                ),
                ProjectCard(
                  image: "lib/assets/images/testmaster.png",
                  title: "TestMaster",
                  description:
                      """Bienvenue dans TestMaster, un framework de tests fonctionnels efficace doté d'une interface claire. Cette plateforme vous permet de tester n'importe quelle sortie de programme en utilisant le format YAML, vous débarrassant ainsi des casse-têtes liés à l'écriture de vos tests.

Avec TestMaster, la réalisation de tests fonctionnels devient un jeu d'enfant. Son interface conviviale facilite la mise en place de scénarios de test et la vérification des résultats attendus. Vous pouvez désormais évaluer rapidement et efficacement les performances de vos programmes et garantir leur bon fonctionnement.
                      """,
                  techImages: [
                    "lib/assets/images/python_logo.svg",
                  ],
                  githubLink: "https://github.com/Louisp78/TestMaster",
                ),
              ],
            ),
            Spacer(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        controller.animateToPage(index);
                      },
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
