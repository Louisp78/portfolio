import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/label_base.dart';
import 'package:portfolio/navigation/slide_down_animation.dart';
import 'package:portfolio/screens/about/about_screen.dart';
import 'package:portfolio/themes.dart';

import 'components/custom_divider.dart';

class CoverScreen extends StatefulWidget {
  const CoverScreen({super.key});

  @override
  State<CoverScreen> createState() => _CoverScreenState();
}
class _CoverScreenState extends State<CoverScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WheelNavigator(
    nextPage: AboutScreen(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_upward),
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: Text(
                  'Portfolio',
                  style: AppFonts.of(context).bigTitle,
                ),
              ),
            ),
            Center(
              child: Image.asset("lib/assets/images/lotus.png", width: 175),
            ),
            // Row of containers
            Positioned(
              bottom: 30,
              child: Column(
                children: [
                  // set height to min height of child content
                  SizedBox(
                    width: size.width,
                    child: const Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        LabelBase(
                          title: "Développement mobile",
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        LabelBase(
                          title: "Développement backend",
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        LabelBase(
                          title: "Design d’application",
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.07,
                  ),
                  Container(
                    child: SizedBox(
                      width: size.width,
                      child: Row(
                        children: [
                          const CustomRowDivider(),
                          Text('Louis Place',
                              style: AppFonts.of(context)
                                  .title
                                  .copyWith(fontSize: 24)),
                          const CustomRowDivider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WheelNavigator extends StatelessWidget {
  final Widget child;
  final Widget? nextPage;

  const WheelNavigator({super.key,
    required this.child,
    this.nextPage,
  }
);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          if (event.scrollDelta.dy > 0 && nextPage != null) {
            Navigator.push(context, SlideDownPageRoute(page: nextPage!));
          } else if (event.scrollDelta.dy < 0 && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }
      },
      child: child);
  }
}



