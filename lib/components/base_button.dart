
import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? color;

  const BaseButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 29, vertical: 8),
        decoration: BoxDecoration(
          color: color ?? AppColors.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: AppFonts.of(context)
              .body
              .copyWith(color: AppColors.of(context).baseColor),
        ),
      ),
    );
  }
}
