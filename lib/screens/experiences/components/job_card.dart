import 'package:flutter/material.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/themes.dart';

class JobCard extends StatelessWidget {
  final JobDTO job;
  const JobCard({super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
          width: MediaQuery.of(context).size.width * 0.35,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.of(context).baseColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(job.date),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(job.title, style: AppFonts.of(context).body.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      color: job.type == "Stage" ? LabelColors.internship : LabelColors.volunteering,
                      borderRadius: BorderRadius.all(Radius.circular(34)),
                    ),
                    child: Text(
                      job.type,
                      style: AppFonts.of(context)
                          .label
                          .copyWith(color: job.type == "Stage" ? AppColors.of(context).baseColor : AppColors.of(context).oppositeBaseColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(job.description, style: AppFonts.of(context).label, overflow: TextOverflow.fade,)
            ],
          ));
  }
}
