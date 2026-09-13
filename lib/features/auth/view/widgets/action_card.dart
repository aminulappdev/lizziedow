import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class SetTypeActionTile extends StatelessWidget {
  const SetTypeActionTile({super.key, 
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h(context),
        padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r(context)),
        ),
        child: Row(
          children: [
            CrashSafeImage(
              iconPath,
              width: 22.w(context),
              height: 22.h(context),
            ),
            SizedBox(width: 14.w(context)),
            Expanded(
              child: Text(
                title,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF403731),
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: const Color(0xFF7E6E63),
              size: 24.sp(context),
            ),
          ],
        ),
      ),
    );
  }
}
