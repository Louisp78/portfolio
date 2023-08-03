import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/components/contact_part.dart';
import 'package:portfolio/tools/send_email.dart';
import 'package:portfolio/tools/visit_url.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactPart(name: 'Localisation :', value: 'Paris, France'),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Email :', value: 'louis.place@epita.fr', onTapValue: () => sendEmail(email: 'louis.place@epita.fr')),
        SizedBox(
          height: 5,
        ),

        ContactPart(name: 'Téléphone :', value: '+33 6 95 40 78 16'),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Github:', value: 'github.com/Louisp78', onTapValue: () =>visitUrl(url:'https://github.com/Louisp78'),
        ),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Linkedin :', value: 'linkedin.com/in/louis-place', onTapValue: () => visitUrl(url: 'https://linkedin.com/in/louis-place'),
        ),
      ],
    );
  }
}
