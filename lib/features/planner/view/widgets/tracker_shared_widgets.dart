import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class TrackerOptionCard extends StatelessWidget {
  const TrackerOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.options,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: LightThemeColors.darkBrown,
                size: 19.sp(context),
              ),
              SizedBox(width: 7.w(context)),
              Text(
                title,
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 15.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h(context)),
          Text(
            subtitle,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.h(context)),
          Wrap(
            spacing: 10.w(context),
            runSpacing: 10.h(context),
            children: options.map((option) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 17.w(context),
                  vertical: 9.h(context),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.r(context)),
                  border: Border.all(color: const Color(0xFFE8DED4)),
                ),
                child: Text(
                  option,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF5D554F),
                    fontSize: 9.5.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}




