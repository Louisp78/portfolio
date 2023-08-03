import 'package:flutter/material.dart';
import 'package:portfolio/themes.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return JobCard();
      },
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
        crossAxisSpacing: size.width * 0.02,
        mainAxisSpacing: size.width * 0.02,
        childAspectRatio: 3,
      )

    );
  }
}


class JobCard extends StatelessWidget {
  const JobCard({super.key});

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
              Text("2023.05 - Present"),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Spliit - Data Analyst", style: AppFonts.of(context).body.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(width: 20),
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(34)),
                    ),
                    child: Text(
                      "Stage",
                      style: AppFonts.of(context)
                          .label
                          .copyWith(color: AppColors.of(context).baseColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Expérience au cours de laquelle j'ai développé un outil à l'aide de Google App Script (Typescript) pour détecter les changements dans les annonces du marché immobilier et analyser les tendances des offres proposées ainsi que les résultats de l'entreprise, grâce à la base de données PostgresQL.", style: AppFonts.of(context).label,)
            ],
          ));
  }
}
