import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class TrackerProgress extends StatelessWidget {
  const TrackerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Row(
        children: [
          Text(
            'Completed',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 14.w(context)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r(context)),
              child: LinearProgressIndicator(
                value: 0.67,
                minHeight: 4.h(context),
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF3C3431),
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w(context)),
          Text(
            '67%',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}