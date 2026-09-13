import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ProfileSaveButton extends StatelessWidget {
  const ProfileSaveButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54.h(context),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: LightThemeColors.buttonColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r(context)),
          ),
        ),
        child: Text(
          'Save Changes',
          style: MyFonts.dmSans.copyWith(
            fontSize: 13.sp(context),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
