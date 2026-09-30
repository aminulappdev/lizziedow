import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/auth/bloc/auth_bloc.dart';
import 'package:lizziedow/features/auth/view/widgets/action_card.dart';
import 'package:lizziedow/features/auth/view/widgets/auth_consent_bottom_sheet.dart';
import 'package:lizziedow/features/auth/view/widgets/speech_box.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class SetTypeScreen extends StatelessWidget {
  const SetTypeScreen({super.key});

  void _showConsentBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r(context)),
        ),
      ),
      builder: (bottomSheetContext) {
        return BlocProvider.value(
          value: context.read<AuthBloc>(),
          child: AuthConsentBottomSheet(
            onAccepted: () {
              Navigator.pop(bottomSheetContext);
              Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 48.h(context)),
              Center(
                child: CrashSafeImage(
                  Assets.images.logo.keyName,
                  width: 170.w(context),
                  height: 170.h(context),
                ),
              ),
              SizedBox(height: 34.h(context)),
              Text(
                'Good Morning',
                textAlign: TextAlign.center,
                style: MyFonts.playfairDisplay.copyWith(
                  color: const Color(0xFFB7ACA4),
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6.h(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Jane',
                    style: MyFonts.playfairDisplay.copyWith(
                      color: const Color(0xFF1F1A17),
                      fontSize: 30.sp(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10.w(context)),
                  Icon(
                    Icons.favorite_border,
                    color: const Color(0xFF1F1A17),
                    size: 30.sp(context),
                  ),
                ],
              ),
              SizedBox(height: 24.h(context)),
              SpeechBox(),
              SizedBox(height: 28.h(context)),
              Row(
                children: [
                  Text(
                    'Cycle Day 12',
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF6F6258),
                      fontSize: 12.sp(context),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r(context)),
                      child: LinearProgressIndicator(
                        value: 0.18,
                        minHeight: 4.h(context),
                        color: const Color(0xFF403731),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  Text(
                    'Follicular phase',
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF6F6258),
                      fontSize: 11.sp(context),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26.h(context)),
              Row(
                children: [
                  Text(
                    'Today',
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF6F6258),
                      fontSize: 15.sp(context),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: const Color(0xFF403731),
                    size: 14.sp(context),
                  ),
                  SizedBox(width: 4.w(context)),
                  Text(
                    '11 August',
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF403731),
                      fontSize: 11.sp(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ), 
              SizedBox(height: 10.h(context)),
              SetTypeActionTile(
                iconPath: Assets.images.calender.keyName,
                title: 'Log Symptoms',
                onTap: () => _showConsentBottomSheet(context),
              ),
              SizedBox(height: 10.h(context)),
              SetTypeActionTile(
                iconPath: Assets.images.medichine.keyName,
                title: 'Track Medications',
                onTap: () => _showConsentBottomSheet(context),
              ),
              SizedBox(height: 10.h(context)),
              SetTypeActionTile(
                iconPath: Assets.images.heart.keyName,
                title: 'Manage Appointments',
                onTap: () => _showConsentBottomSheet(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
