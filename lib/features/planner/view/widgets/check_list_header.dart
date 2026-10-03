import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class CheckListHeaderData extends StatelessWidget {
  const CheckListHeaderData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pre-Treatment',
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF9B8E84),
            fontSize: 11.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CrashSafeImage(
             Assets.images.fileNote.keyName,
             width: 24.w(context),
             height: 24.h(context),
           ),
            SizedBox(width: 6.w(context)),
            Text( 
              'IVF Checklist',
              style: MyFonts.playfairDisplay.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w(context)),
          child: Text(
            'A guided list of everything to consider before starting your journey, tick items off as you go, add your own and stay organised',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}