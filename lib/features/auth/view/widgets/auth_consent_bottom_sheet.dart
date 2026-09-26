import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/auth/bloc/auth_bloc.dart';
import 'package:lizziedow/features/auth/bloc/auth_event.dart';
import 'package:lizziedow/features/auth/bloc/auth_state.dart';
import 'package:lizziedow/features/auth/view/widgets/consent_footer_note.dart';
import 'package:lizziedow/features/auth/view/widgets/consent_option_card.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class AuthConsentBottomSheet extends StatelessWidget {
  const AuthConsentBottomSheet({
    super.key,
    required this.onAccepted,
  });

  final VoidCallback onAccepted;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                18.w(context),
                18.h(context),
                18.w(context),
                14.h(context),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CrashSafeImage(
                    Assets.images.logo.keyName,
                    width: 84.w(context),
                    height: 84.h(context),
                  ),
                  SizedBox(height: 8.h(context)),
                  Text(
                    'Your Consent Matters',
                    textAlign: TextAlign.center,
                    style: MyFonts.instrumentSerif.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 30.sp(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h(context)),
                  Text(
                    'To continue using the app, we need your consent for the following. You can change your preferences at any time in your settings.',
                    textAlign: TextAlign.center,
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF8F837A),
                      fontSize: 10.sp(context),
                      fontWeight: FontWeight.w600,
                      height: 1.25,
                    ),
                  ),
                  SizedBox(height: 18.h(context)),
                  ConsentOptionCard(
                    icon: Icons.cookie_outlined,
                    title: 'Cookie consent',
                    description:
                        'We use cookies to help us understand how you use the app, improve your experience and show you relevant content.',
                    value: state.hasCookieConsent,
                    onChanged: (value) {
                      context.read<AuthBloc>().add(
                        AuthCookieConsentChanged(value),
                      );
                    },
                  ),
                  SizedBox(height: 12.h(context)),
                  ConsentOptionCard(
                    icon: Icons.favorite_border,
                    title: 'Explicit consent',
                    description:
                        'I consent to receive personalised communications, including app updates, wellbeing tips and relevant information from Fertility Sisterhood.',
                    value: state.hasExplicitConsent,
                    onChanged: (value) {
                      context.read<AuthBloc>().add(
                        AuthExplicitConsentChanged(value),
                      );
                    },
                  ),
                  SizedBox(height: 12.h(context)),
                  ConsentOptionCard(
                    icon: Icons.health_and_safety_outlined,
                    title: 'Health data consent',
                    description:
                        'I consent to the collection and processing of my health data, as described in the Privacy Policy, to help personalise my experience and provide relevant support.',
                    value: state.hasHealthDataConsent,
                    onChanged: (value) {
                      context.read<AuthBloc>().add(
                        AuthHealthDataConsentChanged(value),
                      );
                    },
                  ),
                  SizedBox(height: 20.h(context)),
                  CustomButton(
                    text: 'Accept all',
                    onPressed: () => _acceptAll(context),
                    borderRadius: 8.r(context),
                    height: 54.h(context),
                    textStyle: MyFonts.dmSans.copyWith(
                      fontSize: 13.sp(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 14.h(context)),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: LightThemeColors.darkBrown,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Discard',
                      style: MyFonts.dmSans.copyWith(
                        fontSize: 13.sp(context),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ), 
                  SizedBox(height: 14.h(context)),
                  Divider(
                    height: 1.h(context),
                    thickness: 1,
                    color: const Color(0xFFE8DED4),
                  ),
                  SizedBox(height: 14.h(context)),
                  const ConsentFooterNote(
                    text:
                        'Fertility Sisterhood is an organisational tool not substitute for medical supervision - always consult with a doctor.',
                  ),
                  SizedBox(height: 8.h(context)),
                  const ConsentFooterNote(text: 'Medical disclaimer.'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _acceptAll(BuildContext context) {
    context.read<AuthBloc>().add(const AuthAllConsentsAccepted());
    onAccepted();
  }
}
