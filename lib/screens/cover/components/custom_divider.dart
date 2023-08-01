import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Divider(
          color: AppColors.of(context).oppositeBaseColor,
          indent: size.width * 0.02,
          endIndent: size.width * 0.02,
        ));
  }
}
