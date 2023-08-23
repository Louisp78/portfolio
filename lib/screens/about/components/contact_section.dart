import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/components/contact_part.dart';
import 'package:portfolio/screens/about/components/contact_text.dart';
import 'package:portfolio/tools/send_email.dart';
import 'package:portfolio/tools/visit_url.dart';

class ContactSection extends StatelessWidget {
  final bool isCentered;

  const ContactSection({
    super.key,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        ContactText(name: 'Localisation :', value: 'Paris, France'),
        SizedBox(
          height: 5,
        ),
        ContactButton(
            name: 'Email :',
            value: 'louis.place@epita.fr',
            onTapValue: () => sendEmail(email: 'louis.place@epita.fr')),
        SizedBox(
          height: 5,
        ),
        ContactButton(
          name: 'Github:',
          value: 'github.com/Louisp78',
          onTapValue: () => visitUrl(url: 'https://github.com/Louisp78'),
        ),
        SizedBox(
          height: 5,
        ),
        ContactButton(
          name: 'Linkedin :',
          value: 'linkedin.com/in/louis-place',
          onTapValue: () =>
              visitUrl(url: 'https://linkedin.com/in/louis-place'),
        ),
        SizedBox(
          height: 5,
        ),
        ContactButton(
          name: 'Malt :',
          value: 'malt.fr/profile/louisplace',
          onTapValue: () =>
              visitUrl(url: 'https://www.malt.fr/profile/louisplace'),
        ),
      ],
    );
  }
}
