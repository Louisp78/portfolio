import 'package:flutter/material.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/screens/experiences/components/job_card.dart';

class JobsScreen extends StatelessWidget {

  final List<JobDTO> jobs;

  const JobsScreen({super.key,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return JobCard(job: jobs[index],);
      },
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
        crossAxisSpacing: size.width * 0.02,
        mainAxisSpacing: size.width * 0.02,
        childAspectRatio: 3,
      )

    );
  }
}


