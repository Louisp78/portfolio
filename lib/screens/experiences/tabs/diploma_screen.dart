import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/dto/diploma_dto.dart';
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

class DiplomaCard extends StatelessWidget {

  final DiplomaDTO diploma;

  const DiplomaCard({super.key,
    required this.diploma,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.of(context).baseColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(diploma.date),
              Text(diploma.title, style: AppFonts.of(context).body.copyWith(fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text(
                diploma.description,
                style: AppFonts.of(context).label,)
            ],
          ),
        );
  }
}
