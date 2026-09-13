import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/auth/view/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class TrackerCycleSection extends StatelessWidget {
  const TrackerCycleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          SizedBox(height: 10.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CrashSafeImage(
                Assets.images.calender02.path,
                width: 24.w(context),
                height: 24.h(context),
              ),
              SizedBox(width: 8.w(context)),
              Text(
                'Cycle start',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h(context)),
          Text(
            "Set the day your current cycle began. The Dashboard's Cycle Day box updates daily from this date",
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          SizedBox(height: 24.h(context)),
          CustomTextField(
            hintText: 'Enter date',
            controller: TextEditingController(),
            label: '',
          ),
          SizedBox(height: 16.h(context)),
          CustomTextField(
            hintText: 'Enter cycle length',
            controller: TextEditingController(),
            label: '',
          ),
          SizedBox(height: 198.h(context)),
          Text(
            'Today is Day 59 of cycle 01.',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 14.h(context)),
          CustomButton(
            text: 'Update Cycle',
            onPressed: () {},
            borderRadius: 12.r(context),
          ),
        ],
      ),
    );
  }
}
