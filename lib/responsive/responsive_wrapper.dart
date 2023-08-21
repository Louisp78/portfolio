import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive_widget.dart';

class ResponsiveWrapper extends StatelessWidget {
  final List<ResponsiveWidget> widgets;

  const ResponsiveWrapper({
    super.key,
    required this.widgets,
  });

  List<ResponsiveWidget> get sortedWidgets =>
      widgets..sort((a, b) => a.maxWidth.compareTo(b.maxWidth));

  // add height if not null
  bool checkResponsive(BuildContext context, widget) {
    if (widget.width != null){
      return MediaQuery.of(context).size.width == widget.width &&
      MediaQuery.of(context).size.height == widget.height;
    } else {
      return  MediaQuery.of(context).size.width < widget.maxWidth &&
      MediaQuery.of(context).size.width >= widget.minWidth &&
      MediaQuery.of(context).size.height < widget.maxHeight &&
      MediaQuery.of(context).size.height >= widget.minHeight;
    }
  }


  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < sortedWidgets.length; i++) {
      if (checkResponsive(context, sortedWidgets[i])) {
        return sortedWidgets[i].widget;
      }
    }
    return Container();
  }
}
