import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/dto/diploma_dto.dart';
import 'package:portfolio/screens/experiences/components/diploma_card.dart';
import 'package:portfolio/themes.dart';

class DiplomaScreen extends StatelessWidget {
  final List<DiplomaDTO> diplomas;
  const DiplomaScreen({super.key, required this.diplomas});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return DiplomaCard(diploma: diplomas[index],);
        },
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
          crossAxisSpacing: size.width * 0.02,
          mainAxisSpacing: size.width * 0.02,
          childAspectRatio: 3,
        )
      );
  }
}


