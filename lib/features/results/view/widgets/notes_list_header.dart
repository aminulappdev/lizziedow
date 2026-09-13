import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class NotesListHeader extends StatelessWidget {
  const NotesListHeader({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: MyFonts.dmSans.copyWith(
            color: LightThemeColors.darkBrown,
            fontSize: 14.sp(context),
            fontWeight: FontWeight.w800,
          ),
        ),
        const Spacer(),
        Text(
          '$count Total',
          style: MyFonts.dmSans.copyWith(
            color: LightThemeColors.darkBrown,
            fontSize: 10.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
