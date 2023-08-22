import 'package:flutter/material.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/responsive/responsive_widget.dart';
import 'package:portfolio/responsive/responsive_wrapper.dart';
import 'package:portfolio/screens/experiences/components/job_card.dart';

class JobsScreen extends StatelessWidget {
  final List<JobDTO> jobs;

  const JobsScreen({
    super.key,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ResponsiveWrapper(
      widgets: [
        ResponsiveWidget(
          minWidth: ResponsiveConfig.mobilePortraitMaxWidth,
          widget: GridView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return JobCard(
                  job: jobs[index],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: size.width * 0.02,
                mainAxisSpacing: size.width * 0.02,
                childAspectRatio:
                    ResponsiveConfig.isExperienceScreenWidthStep1(context)
                        ? 1
                        : 2,
              ),),
        ),
        ResponsiveWidget(
          maxWidth: ResponsiveConfig.mobilePortraitMaxWidth,
            widget: ListView.builder(itemBuilder:
            (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: JobCard(
                  job: jobs[index],
                ),
              );
            },
            itemCount: jobs.length,

            ),
        )
      ],
    );
  }
}
