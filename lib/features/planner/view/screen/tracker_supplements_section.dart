import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class TrackerSupplementsSection extends StatelessWidget {
  const TrackerSupplementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Supplements',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 20.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 12.h(context)),
          Text(
            'Supplement tracker will appear here.',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
