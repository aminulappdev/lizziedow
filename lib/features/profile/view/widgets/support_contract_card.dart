import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class SupportContactCard extends StatelessWidget {
  const SupportContactCard({super.key, 
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 52.h(context)),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w(context),
        vertical: 10.h(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
        border: Border.all(color: const Color(0xFFE8DED4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8A7C72), size: 18.sp(context)),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 11.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h(context)),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFFB1A59E),
                    fontSize: 9.sp(context),
                    fontWeight: FontWeight.w700,
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
