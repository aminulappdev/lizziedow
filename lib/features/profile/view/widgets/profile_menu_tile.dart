import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/model/profile_model.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.item,
    required this.onTap,
    this.showDivider = true,
  });

  final ProfileMenuItemData item;
  final VoidCallback onTap;
  final bool showDivider;

  @override 
  Widget build(BuildContext context) {
    final color = item.isDestructive
        ? const Color(0xFFC95757)
        : LightThemeColors.darkBrown;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w(context),
              vertical: 15.h(context),
            ),
            child: Row(
              children: [
                CrashSafeImage(
                  item.icon,
                  width: 20.w(context),
                  height: 20.h(context),
                  color: color,
                ),
                SizedBox(width: 12.w(context)),
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MyFonts.dmSans.copyWith(
                      color: color,
                      fontSize: 13.sp(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: const Color(0xFF9E938C),
                  size: 18.sp(context),
                ),
              ],
            ),
          ),
          if (showDivider)
            Divider(
              height: 1.h(context),
              thickness: 1,
              indent: 16.w(context),
              endIndent: 16.w(context),
              color: const Color(0xFFF0E7DC),
            ),
        ],
      ),
    );
  }
}
