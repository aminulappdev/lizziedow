import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, 
    required this.title,
    required this.trailing,
    this.onTap,
  });

  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 14.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: LightThemeColors.darkBrown,
              disabledForegroundColor: LightThemeColors.darkBrown,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w(context),
                vertical: 4.h(context),
              ),
            ),
            child: trailing,
          ),
        ],
      ),
    );
  }
}