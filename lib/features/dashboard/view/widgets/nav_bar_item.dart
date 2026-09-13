import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/screen/home_screen.dart';
import 'package:lizziedow/features/planner/view/screen/planner_screen.dart';

class DashboardNavItem {
  const DashboardNavItem({required this.icon, required this.label});

  final String icon;
  final String label;
}

class DashboardTabBody extends StatelessWidget {
  const DashboardTabBody({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const PlannerScreen();
    }

    if (index == 2) {
      return const HomeScreen();
    }

    return Center(
      child: Text(
        'Coming soon',
        style: MyFonts.dmSans.copyWith(
          color: LightThemeColors.darkBrown,
          fontSize: 16.sp(context),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
