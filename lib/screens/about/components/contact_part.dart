import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/components/contact_text.dart';
import 'package:portfolio/themes.dart';

class ContactButton extends StatefulWidget {
  final String name;
  final String value;
  final void Function()? onTapValue;

  const ContactButton({
    super.key,
    required this.name,
    required this.value,
    this.onTapValue,
  });

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTapValue,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.of(context).oppositeBaseColor, width: isHovered ? 0 : 2),
            borderRadius: BorderRadius.circular(10),
            color: isHovered ? AppColors.of(context).primaryColor : Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          duration: Duration(milliseconds: 200),
          child: ContactText(
            name: widget.name,
            value: widget.value,
            isHovered: isHovered,
          )
        ),
      ),
    );
  }
}
