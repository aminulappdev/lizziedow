import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/model/profile_model.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key, required this.user});

  final ProfileUserData user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w(context),
        vertical: 14.h(context),
      ),
      decoration: BoxDecoration(
        color: LightThemeColors.buttonColor,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Row(
        children: [
          Container(
            width: 45.w(context),
            height: 45.w(context),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              user.initials,
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.buttonColor,
                fontSize: 15.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(width: 12.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3.h(context)),
                Text(
                  user.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: Colors.white.withValues(alpha: 0.72),
                    fontSize: 10.sp(context),
                    fontWeight: FontWeight.w600,
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
