import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CircleIconWidgets extends StatelessWidget {
  const CircleIconWidgets({
    super.key,
    required this.iconPath,
    this.iconRadius,
    this.padding,
  });

  final String iconPath;
  final double? iconRadius; 
  final double? padding;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightThemeColors.cardBg,
        shape: BoxShape.circle,
        border: Border.all(color: LightThemeColors.cardBg, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding ?? 8.r(context)),
        child: Center(
          child: CrashSafeImage(
            iconPath,
            width: iconRadius ?? 18.w(context),
            height: iconRadius ?? 18.h(context),
            color: LightThemeColors.darkBrown,
          ),
        ),
      ),
    );
  }
}
