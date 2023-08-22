import 'package:flutter/material.dart';
import 'package:portfolio/responsive/responsive_config.dart';
import 'package:portfolio/themes.dart';

class TabSwitcher extends StatelessWidget {
  final TabController _tabController;
  final int _currentIndex;

  const TabSwitcher({
    super.key,
    required TabController tabController,
    required int currentIndex,
  })  : _tabController = tabController,
        _currentIndex = currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.all(
          Radius.circular(46),
        ),
      ),
      child: Stack(
        alignment:
            _currentIndex == 0 ? Alignment.centerLeft : Alignment.centerRight,
        children: [
          Container(
            width: ResponsiveConfig.isMobileWidth(context) ? 120 : 141,
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 9),
            decoration: BoxDecoration(
              color: _currentIndex == 0 ? AppColors.of(context).primaryColor : AppColors.of(context).secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(46)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  _tabController.animateTo(0);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 45 / 2),
                  child: Text(
                    "Experiences",
                    style: AppFonts.of(context).body.copyWith(
                        color: _currentIndex == 0
                            ? AppColors.of(context).baseColor
                            : AppColors.of(context).subTextColor),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  _tabController.animateTo(1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 45 / 2),
                  child: Text(
                    "Diplomes",
                    style: AppFonts.of(context).body.copyWith(
                        color: _currentIndex == 0
                            ? AppColors.of(context).subTextColor
                            : AppColors.of(context).baseColor),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
