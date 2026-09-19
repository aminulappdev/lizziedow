import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });
 
  final String title;
  final String description; 
  final String icon;

  @override 
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w(context),
        vertical: 12.h(context),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFFBF7F2),
        borderRadius: BorderRadius.circular(9.r(context)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CrashSafeImage(
            icon,
            width: 26.w(context),
            height: 26.h(context),
            color: LightThemeColors.darkBrown,
          ),
          SizedBox(height: 8.h(context)),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: MyFonts.instrumentSerif.copyWith(
              color: const Color(0xFF4A403A),
              fontSize: 20.sp(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 7.h(context)),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB4A79C),
              fontSize: 8.5.sp(context),
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
