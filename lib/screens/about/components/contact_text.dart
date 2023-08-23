
import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class ContactText extends StatelessWidget {

  final String name;
  final String value;
  final bool isHovered;

  const ContactText({super.key,
    required this.name,
    required this.value,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "${name} ",
        style: AppFonts.of(context).label.copyWith(fontWeight: FontWeight.bold, color: isHovered ? AppColors.of(context).baseColor : AppColors.of(context).oppositeBaseColor),
        children: [
          TextSpan(
            text: value,
            style: AppFonts.of(context).label.copyWith(color: isHovered ? AppColors.of(context).baseColor : AppColors.of(context).oppositeBaseColor),
          ),
        ],
      ),
    );
  }
}
