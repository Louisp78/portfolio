import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class LabelBase extends StatelessWidget {
  final String title;

  const LabelBase({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.of(context).textColor, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppFonts.of(context).button,
        ),
      ),
    );
  }
}
