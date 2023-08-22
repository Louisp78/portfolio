import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/components/custom_background.dart';
import 'package:portfolio/components/wheel_navigator.dart';
import 'package:portfolio/dto/diploma_dto.dart';
import 'package:portfolio/dto/job_dto.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/themes.dart';
import 'components/tab_switcher.dart';
import 'tabs/diploma_screen.dart';
import 'tabs/jobs_screen.dart';

class ExperiencesScreen extends StatefulWidget {
  const ExperiencesScreen({super.key});

  @override
  State<ExperiencesScreen> createState() => _ExperiencesScreenState();
}

class _ExperiencesScreenState extends State<ExperiencesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  late List<DiplomaDTO> diplomas;
  late List<JobDTO> jobs;

  Future<void> loadJobData() async {
    final String jobJsonString =
        await rootBundle.loadString('lib/assets/data/job.json');
    final List<dynamic> jobJsonData = json.decode(jobJsonString);
    jobs = jobJsonData.map((data) => JobDTO.fromJson(data)).toList();
  }

  Future<void> loadDiplomaData() async {
    final String diplomaJsonString =
        await rootBundle.loadString('lib/assets/data/diploma.json');
    final List<dynamic> diplomaJsonData = json.decode(diplomaJsonString);
    diplomas =
        diplomaJsonData.map((data) => DiplomaDTO.fromJson(data)).toList();
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      handleTabChange();
      loadDiplomaData();
      loadJobData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void handleTabChange() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          CustomBackground(
              color: _currentTabIndex == 0
                  ? AppColors.of(context).primaryColor
                  : AppColors.of(context).secondaryColor,
              lightWidth: 500,
              lightHeight: 500,
              alignment: Alignment.topRight),
          Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabSwitcher(
                  tabController: _tabController,
                  currentIndex: _currentTabIndex,
                ),
                if (!ResponsiveConfig.isMobileWidth(context)) Spacer(),
                if (ResponsiveConfig.isMobileWidth(context))
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                SizedBox(
                  height: size.height * 0.7,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FutureBuilder(
                          future: loadJobData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child:
                                      Text('Erreur de chargement des données'));
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return JobsScreen(jobs: jobs);
                            }
                          }),
                      FutureBuilder(
                          future: loadDiplomaData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                  child:
                                      Text('Erreur de chargement des données'));
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return DiplomaScreen(diplomas: diplomas);
                            }
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
