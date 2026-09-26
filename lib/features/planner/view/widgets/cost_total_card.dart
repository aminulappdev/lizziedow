import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CostTotalCard extends StatelessWidget {
  const CostTotalCard({
    super.key,
    required this.amount,
    this.title = 'Total Spent',
  });

  final String amount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w(context),
        vertical: 14.h(context),
      ),
      decoration: BoxDecoration(
        color: LightThemeColors.cardBg,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8A7C72),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 2.h(context)),
          Text(
            amount,
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 24.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
