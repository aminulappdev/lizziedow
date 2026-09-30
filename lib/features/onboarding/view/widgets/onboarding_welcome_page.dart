import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_page_dots.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class OnboardingWelcomePage extends StatelessWidget {
  const OnboardingWelcomePage({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 4),
        CrashSafeImage(
          Assets.images.logo.keyName,
          width: 225.w(context),
          height: 225.h(context),
        ),
        SizedBox(height: 100.h(context)),
        OnboardingPageDots(currentPage: currentPage),
        SizedBox(height: 18.h(context)), 
        Text(
          'Welcome to the\nsisterhood',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: MyFonts.playfairDisplay.fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 34.sp(context),
                color: const Color(0xFF1E1E1E),
              ),
        ),
        SizedBox(height: 10.h(context)), 
        Text(
          'Everything you need, in one place',
          textAlign: TextAlign.center,
          style: MyFonts.dmSans.copyWith(
            fontSize: 13.sp(context),
            fontWeight: FontWeight.w500,
            color: const Color(0xFF515151),
          ),
        ),
        SizedBox(height: 30.h(context)),
      ],
    );
  }
}
