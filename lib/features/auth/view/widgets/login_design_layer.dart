import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class LoginDesignLayer extends StatelessWidget {
  const LoginDesignLayer({
    super.key,
    this.title = 'Login to\nyour account',
    this.subtitle = 'Your journey in your way',
    this.titleTopSpacing,
  }); 

  final String title;
  final String subtitle;
  final double? titleTopSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h(context)),
        Center(
          child: CrashSafeImage(
            Assets.images.logo.keyName,
            width: 160.w(context),
            height: 160.h(context),
          ),
        ),
        SizedBox(height: (titleTopSpacing ?? 92).h(context)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: MyFonts.instrumentSerif.copyWith(
            color: const Color(0xFF1F1A17),
            fontSize: 42.sp(context),
            height: 1.1,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h(context)),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF939291),
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
