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

class AuthConsentBottomSheet extends StatefulWidget {
  const AuthConsentBottomSheet({
    super.key,
    required this.onAccepted,
  });

  final VoidCallback onAccepted;

  @override
  State<AuthConsentBottomSheet> createState() => _AuthConsentBottomSheetState();
}

class _AuthConsentBottomSheetState extends State<AuthConsentBottomSheet> {
  int _currentStep = 0;

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
                  const _ConsentHeader(),
                  SizedBox(height: 18.h(context)),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    switchInCurve: Curves.easeOutCubic,
                    switchOutCurve: Curves.easeInCubic,
                    transitionBuilder: (child, animation) {
                      final offset = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation);

                      return SlideTransition(
                        position: offset,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: _currentStep == 0
                        ? _ConsentPreferenceStep(
                            key: const ValueKey('consent-preferences'),
                            state: state,
                            onNext: () {
                              setState(() => _currentStep = 1);
                            },
                          )
                        : _HealthDataStep(
                            key: const ValueKey('health-data'),
                            state: state,
                            onAccepted: () => _acceptAll(context),
                          ),
                  ),
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
    widget.onAccepted();
  }
}

class _ConsentHeader extends StatelessWidget {
  const _ConsentHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: MyFonts.playfairDisplay.copyWith(
            color: LightThemeColors.darkBrown,
            fontSize: 26.sp(context),
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
      ],
    );
  }
}

class _ConsentPreferenceStep extends StatelessWidget {
  const _ConsentPreferenceStep({
    super.key,
    required this.state,
    required this.onNext,
  });

  final AuthState state;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: 20.h(context)),
        CustomButton(
          text: 'Next',
          onPressed: onNext,
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
              'Fertility Sisterhood is an organisational and informational tool, not a substitute for medical supervision or professional medical advice.',
        ),
        SizedBox(height: 8.h(context)),
        const ConsentFooterNote(
          text:
              'Always consult your doctor or fertility specialist regarding your individual treatment, medication, symptoms or healthcare decisions.',
        ),
        SizedBox(height: 8.h(context)),
        const ConsentFooterNote(
          text:
              'Please do not make changes to your treatment based solely on information provided through the app.',
        ),
      ],
    );
  }
}

class _HealthDataStep extends StatelessWidget {
  const _HealthDataStep({
    super.key,
    required this.state,
    required this.onAccepted,
  });

  final AuthState state;
  final VoidCallback onAccepted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HealthDataConsentCard(
          value: state.hasHealthDataConsent,
          onChanged: (value) {
            context.read<AuthBloc>().add(
                  AuthHealthDataConsentChanged(value),
                );
          },
        ),
        SizedBox(height: 16.h(context)),
        CustomButton(
          text: 'Accept all',
          onPressed: onAccepted,
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
            'Not now',
            style: MyFonts.dmSans.copyWith(
              fontSize: 13.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _HealthDataConsentCard extends StatelessWidget {
  const _HealthDataConsentCard({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        18.w(context),
        18.h(context),
        18.w(context),
        16.h(context),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF5F1),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 36.w(context),
                height: 36.h(context),
                decoration: const BoxDecoration(
                  color: Color(0xFFF1E8E0),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.health_and_safety_outlined,
                  color: const Color(0xFF8A7C72),
                  size: 18.sp(context),
                ),
              ),
              SizedBox(width: 12.w(context)),
              Expanded(
                child: Text(
                  'Your fertility data',
                  style: MyFonts.playfairDisplay.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 18.sp(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h(context)),
          Text(
            'Fertility Sisterhood lets you store information about your fertility journey, such as treatment details, medications, appointments, cycle information, symptoms and test results.',
            style: _bodyStyle(context),
          ),
          SizedBox(height: 14.h(context)),
          Text(
            'This information may constitute health data, which receives additional protection under UK data protection law.',
            style: _bodyStyle(context),
          ),
          SizedBox(height: 14.h(context)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 18.w(context),
                height: 18.h(context),
                child: Transform.scale(
                  scale: 0.9,
                  child: Checkbox(
                    value: value,
                    activeColor: LightThemeColors.buttonColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    side: const BorderSide(color: Color(0xFFB9A99B)),
                    onChanged: (checked) => onChanged(checked ?? false),
                  ),
                ),
              ),
              SizedBox(width: 10.w(context)),
              Expanded(
                child: Text(
                  'I explicitly consent to Fertility Sisterhood processing the fertility and health information I choose to enter into the app so that it can provide its fertility organisation, tracking and reminder features.',
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF5F554E),
                    fontSize: 10.sp(context),
                    fontWeight: FontWeight.w800,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h(context)),
          Text(
            'You can withdraw your consent through Privacy & Data Settings. If you withdraw consent, we will stop processing health information on the basis of that consent and explain what this means for your account and stored data.',
            style: _bodyStyle(context),
          ),
        ],
      ),
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    return MyFonts.dmSans.copyWith(
      color: const Color(0xFF8F837A),
      fontSize: 10.sp(context),
      fontWeight: FontWeight.w600,
      height: 1.35,
    );
  }
}
