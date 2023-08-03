import 'package:flutter/material.dart';
import 'package:portfolio/dto/diploma_dto.dart';
import 'package:portfolio/themes.dart';

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
        color: diploma.isCurrent ? Color(0xffD0D0D0) : AppColors.of(context).baseColor,
        border: diploma.isCurrent ? Border.all(color: Colors.black, width: 2) : null,
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
