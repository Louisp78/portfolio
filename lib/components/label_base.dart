import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class LabelBase extends StatelessWidget {
  final String title;
  final VoidCallback? onPress;

  const LabelBase({
    super.key,
    required this.title,
    this.onPress,
  });

  Widget buildLabel(context) {
    return  Container(
        padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.of(context).oppositeBaseColor, width: 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppFonts.of(context).button,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    if (onPress != null)
      return InkWell(
      onTap: onPress,
      child: buildLabel(context),
    );
    else
      return buildLabel(context);
  }
}
