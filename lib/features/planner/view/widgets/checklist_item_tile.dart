import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ChecklistItemTile extends StatelessWidget {
  const ChecklistItemTile({
    super.key,
    required this.title,
    required this.isCompleted,
  });

  final String title;
  final bool isCompleted;

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
      child: Row(
        children: [
          Container(
            width: 18.w(context),
            height: 18.w(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted
                    ? LightThemeColors.buttonColor
                    : const Color(0xFFE2D7CC),
              ),
              color: isCompleted
                  ? LightThemeColors.buttonColor
                  : Colors.transparent,
            ),
            child: isCompleted
                ? Icon(
                    Icons.check,
                    size: 12.sp(context),
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(width: 12.w(context)),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF5C544F),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
