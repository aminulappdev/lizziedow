import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class ProfileConfirmationBottomSheet extends StatelessWidget {
  const ProfileConfirmationBottomSheet({
    super.key,
    required this.title,
    required this.message,
    required this.actionText,
    required this.onAction,
    this.discardText = 'Discard',
  });

  final String title;
  final String message;
  final String actionText;
  final VoidCallback onAction;
  final String discardText;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          18.w(context),
          28.h(context),
          18.w(context),
          18.h(context),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.h(context)),
            Text(
              message,
              textAlign: TextAlign.center,
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF8F837A),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
            SizedBox(height: 30.h(context)),
            CustomButton(
              text: actionText,
              onPressed: onAction,
              borderRadius: 8.r(context),
              height: 54.h(context),
              textStyle: MyFonts.dmSans.copyWith(
                fontSize: 14.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 18.h(context)),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: LightThemeColors.darkBrown,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                discardText,
                style: MyFonts.dmSans.copyWith(
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
