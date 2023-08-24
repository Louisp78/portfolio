import 'package:flutter/material.dart';
import 'package:portfolio/components/modal_with_dynamic_rounded_corners.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/experiences/components/job_type_label.dart';
import 'package:portfolio/themes.dart';

class JobCard extends StatelessWidget {
  final JobDTO job;

  const JobCard({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(

      builder: (context, constraints) => Container(
          width: MediaQuery.of(context).size.width * 0.35,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.of(context).baseColor,
            borderRadius:  BorderRadius.circular(getDynamicBorderRadius(constraints, baseBorderRadiusPercent)),
            boxShadow: [
              baseShadow,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(job.date),
              ResponsiveWrapper(
                widgets: [
                  ResponsiveWidget(
                    minWidth: ResponsiveConfig.experienceScreenWidthStep1,
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          job.title,
                          style: AppFonts.of(context)
                              .body
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        JobTypeLabel(job: job),
                      ],
                    ),
                  ),
                  ResponsiveWidget(
                    maxWidth: ResponsiveConfig.experienceScreenWidthStep1,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: AppFonts.of(context)
                              .body
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        JobTypeLabel(job: job),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                job.description,
                style: AppFonts.of(context).label,
                overflow: TextOverflow.fade,
              )
            ],
          )),
    );
  }
}
