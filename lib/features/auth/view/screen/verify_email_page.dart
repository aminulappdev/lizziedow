import 'package:flutter/material.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/app/utils/validator_services.dart';
import 'package:lizziedow/features/auth/view/widgets/app_pin_code_field.dart';
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/auth/view/widgets/login_design_layer.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    super.key,
    this.email = '',
    this.nextRoute = RoutesName.loginScreen,
  });

  final String email;
  final String nextRoute;

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _verifyEmail() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushReplacementNamed(context, widget.nextRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LoginDesignLayer(
                          title: 'Verify your email',
                          subtitle: widget.email.isEmpty
                              ? 'Enter the OTP sent to your email'
                              : 'Enter the OTP sent to ${widget.email}',
                          titleTopSpacing: 92,
                        ),
                        SizedBox(height: 34.h(context)),
                        const LabelText(label: 'Verification Code'),
                        SizedBox(height: 8.h(context)),
                        AppPinCodeField(
                          controller: _otpController,
                          length: 6,
                          validator: ValidatorService.validateSimpleField,
                        ),
                        Row(
                          children: [
                            Text(
                              'Resend (00:00)',
                              style: MyFonts.dmSans.copyWith(
                                color: const Color(0xFF757575),
                                fontSize: 14.sp(context),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Send code again',
                                style: MyFonts.dmSans.copyWith(
                                  color: const Color(0xFF757575),
                                  fontSize: 14.sp(context),
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h(context)),
                        CustomButton(
                          text: 'Continue',
                          onPressed: _verifyEmail,
                        ),
                        SizedBox(height: 28.h(context)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
