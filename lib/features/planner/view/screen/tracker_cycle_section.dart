import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_shared_widgets.dart';

class TrackerCycleSection extends StatelessWidget {
  const TrackerCycleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          SizedBox(height: 18.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_month_outlined,
                color: LightThemeColors.darkBrown,
                size: 25.sp(context),
              ),
              SizedBox(width: 8.w(context)),
              Text(
                'Cycle start',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h(context)),
          Text(
            "Set the day your current cycle began. The Dashboard's Cycle Day box updates daily from this date",
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          SizedBox(height: 24.h(context)),
          const TrackerTextField(
            hintText: 'Enter date',
            suffixIcon: Icons.calendar_today,
          ),
          SizedBox(height: 16.h(context)),
          const TrackerTextField(
            hintText: 'Category',
            suffixIcon: Icons.keyboard_arrow_down,
          ),
          SizedBox(height: 198.h(context)),
          Text(
            'Today is Day 59 of cycle 01.',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 14.h(context)),
          TrackerPrimaryButton(label: 'Update Cycle', onPressed: () {}),
        ],
      ),
    );
  }
}
