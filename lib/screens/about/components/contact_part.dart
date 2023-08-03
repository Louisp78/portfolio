import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class ContactPart extends StatelessWidget {
  final String name;
  final String value;
  final Function()? onTapValue;

  const ContactPart({
    super.key,
    required this.name,
    required this.value,
    this.onTapValue,
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
            recognizer: onTapValue != null ? (TapGestureRecognizer()..onTap = onTapValue) : null,
          ),
        ],
      ),
    );
  }
}
