
import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';
import 'package:portfolio/tools/visit_url.dart';

class LotusAttribution extends StatelessWidget {
  const LotusAttribution({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        decoration: BoxDecoration(color: AppColors.of(context).backColor),
        child: GestureDetector(
          onTap: () =>
              visitUrl(url: "https://www.flaticon.com/free-icons/lotus"),
          child: Text("Lotus icons created by justicon - Flaticon",
              style: TextStyle(color: AppColors.of(context).subTextColor)),
        ));
  }
}
