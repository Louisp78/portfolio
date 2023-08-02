import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class ContactPart extends StatelessWidget {
  final String name;
  final String value;

  const ContactPart({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$name ",
        style: AppFonts.of(context).label.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: value,
            style: AppFonts.of(context).label,
          ),
        ],
      ),
    );
  }
}
