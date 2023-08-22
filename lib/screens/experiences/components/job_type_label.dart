import 'package:flutter/material.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/themes.dart';

class JobTypeLabel extends StatelessWidget {
  final JobDTO job;

  const JobTypeLabel({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
        color: job.type == "Stage"
            ? LabelColors.internship
            : LabelColors.volunteering,
        borderRadius: BorderRadius.all(Radius.circular(34)),
      ),
      child: Text(
        job.type,
        style: AppFonts.of(context).label.copyWith(
            color: job.type == "Stage"
                ? AppColors.of(context).baseColor
                : AppColors.of(context).oppositeBaseColor),
      ),
    );
  }
}
