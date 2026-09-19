import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.title,
    required this.subtitle01,
    required this.subtitle02,
    required this.showDivider,
    required this.iconPath,
    this.trailingWidget,
  });

  final String title;
  final String subtitle01;
  final String subtitle02;
  final String iconPath;
  final Widget? trailingWidget;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: showDivider ? const Color(0xFFDCCFC3) : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h(context)),
      child: Row(
        children: [
          Container(
            width: 34.w(context),
            height: 34.w(context),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFBF7F2),
                width: 1,
              ),
            ),
            child: Center(
              child: CrashSafeImage(
                iconPath,
                width: 18.w(context),
                height: 18.h(context),
                color: LightThemeColors.darkBrown,
              ),
            ),
          ),
          SizedBox(width: 12.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h(context)),
                Row(
                  children: [
                    Text(
                      subtitle01,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MyFonts.dmSans.copyWith(
                        color: const Color(0xFF8E8278),
                        fontSize: 10.5.sp(context),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 2.w(context)),
                    Text(
                      ' . ',
                      style: MyFonts.dmSans.copyWith(
                        color: const Color(0xFF8E8278),
                        fontSize: 10.5.sp(context),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 2.w(context)),

                    Text(
                      subtitle02,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MyFonts.dmSans.copyWith(
                        color: const Color(0xFF8E8278),
                        fontSize: 10.5.sp(context),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w(context)),
          ?trailingWidget,
        ],
      ),
    );
  }
}
