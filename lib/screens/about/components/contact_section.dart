import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/components/contact_part.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactPart(name: 'Localisation :', value: 'Paris, France'),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Email :', value: 'louis.place@epita.fr'),
        SizedBox(
          height: 5,
        ),

        ContactPart(name: 'Téléphone :', value: '+33 6 00 00 00 00'),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Github:', value: 'github.com/Louisp78'),
        SizedBox(
          height: 5,
        ),
        ContactPart(name: 'Linkedin :', value: 'linkedin.com/in/louis-place'),
      ],
    );
  }
}
