import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/navigation/slide_down_animation.dart';

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



