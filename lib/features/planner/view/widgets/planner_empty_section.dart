import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class PlannerEmptySection extends StatelessWidget {
  const PlannerEmptySection({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        18.w(context),
        42.h(context),
        18.w(context),
        0,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(22.r(context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 16.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8.h(context)),
            Text(
              subtitle,
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF8E8278),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
