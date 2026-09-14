import 'package:flutter/material.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/app/utils/validator_services.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/auth/view/widgets/login_design_layer.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitEmail() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(
        context,
        RoutesName.verifyEmailScreen,
        arguments: {
          'email': _emailController.text.trim(),
          'nextRoute': RoutesName.setPasswordScreen,
        },
      );
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
                    padding: EdgeInsets.symmetric(horizontal: 22.w(context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const LoginDesignLayer(
                          title: 'Forgot password',
                          subtitle: 'Enter your email to receive an OTP',
                          titleTopSpacing: 92,
                        ),
                        SizedBox(height: 34.h(context)),
                        const LabelText(label: 'Email'),
                        SizedBox(height: 6.h(context)),
                        CustomTextField(
                          controller: _emailController,
                          label: 'Email',
                          hintText: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _emailFocus,
                          textInputAction: TextInputAction.done,
                          validator: ValidatorService.validateEmailAddress,
                          onFieldSubmitted: (_) => _submitEmail(),
                        ),
                        SizedBox(height: 24.h(context)),
                        CustomButton(
                          text: 'Submit',
                          onPressed: _submitEmail,
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
