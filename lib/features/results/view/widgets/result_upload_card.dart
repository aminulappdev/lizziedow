import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class CustomUploadCard extends StatelessWidget {
  const CustomUploadCard({
    super.key,
    this.iconPath,  
    this.icon,
    this.title = 'Drag and drop your files',
    this.subtitle = 'JPEG, PND, PDF, and MP4 formats, up to 50MB',
    required this.buttonText,
    required this.onPressed,
  });

  final String? iconPath;
  final Widget? icon;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w(context),
        vertical: 24.h(context),
      ),
      decoration: BoxDecoration(
        color: LightThemeColors.cardBg,
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      child: Column(
        children: [
          icon ??
              CrashSafeImage(
                iconPath ?? Assets.images.fileAdd.path,
                width: 36.w(context),
                height: 36.h(context),
              ),
          SizedBox(height: 14.h(context)),
          Text(
            title,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFD9D0CA),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h(context)),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB1A59E),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h(context)),
          SizedBox(
            height: 31.h(context),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: LightThemeColors.buttonColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r(context)),
                ),
              ),
              child: Text(
                buttonText,
                style: MyFonts.dmSans.copyWith(
                  fontSize: 12.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
