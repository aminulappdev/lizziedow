import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/app/utils/validator_services.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/auth/bloc/auth_bloc.dart';
import 'package:lizziedow/features/auth/bloc/auth_event.dart';
import 'package:lizziedow/features/auth/bloc/auth_state.dart';
import 'package:lizziedow/features/auth/view/widgets/have_account.dart';
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/auth/view/widgets/login_design_layer.dart';
import 'package:lizziedow/features/auth/view/widgets/login_devider.dart';
import 'package:lizziedow/features/auth/view/widgets/password_visibility_icon.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/profile/repository/profile_repository.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the Terms & Conditions.'),
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(
        context,
        RoutesName.verifyEmailScreen,
        arguments: {
          'email': _emailController.text.trim(),
          'nextRoute': RoutesName.setTypeScreen,
        },
      );
    }
  }

  void _openTermsAndConditions() {
    const profileRepository = ProfileRepository();

    Navigator.pushNamed(
      context,
      RoutesName.profileInfoScreen,
      arguments: {
        'header': 'Terms & Conditions',
        'data': profileRepository.termsConditions,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: LightThemeColors.scaffoldBackgroundColor,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.w(context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const LoginDesignLayer(
                                title: 'Create your account',
                                subtitle: 'Start your journey with us',
                                titleTopSpacing: 30,
                              ),
                              SizedBox(height: 24.h(context)),
                              const LabelText(label: 'Username'),
                              SizedBox(height: 6.h(context)),
                              CustomTextField(
                                controller: _usernameController,
                                label: 'Username',
                                hintText: 'Enter your username',
                                focusNode: _usernameFocus,
                                textInputAction: TextInputAction.next,
                                validator: ValidatorService.validateSimpleField,
                                onFieldSubmitted: (_) {
                                  _emailFocus.requestFocus();
                                },
                              ),
                              SizedBox(height: 14.h(context)),
                              const LabelText(label: 'Email'),
                              SizedBox(height: 6.h(context)),
                              CustomTextField(
                                controller: _emailController,
                                label: 'Email',
                                hintText: 'Enter your email address',
                                keyboardType: TextInputType.emailAddress,
                                focusNode: _emailFocus,
                                textInputAction: TextInputAction.next,
                                validator:
                                    ValidatorService.validateEmailAddress,
                                onFieldSubmitted: (_) {
                                  _passwordFocus.requestFocus();
                                },
                              ),
                              SizedBox(height: 14.h(context)),
                              const LabelText(label: 'Password'),
                              SizedBox(height: 6.h(context)),
                              CustomTextField(
                                controller: _passwordController,
                                label: 'Password',
                                hintText: 'Enter your password',
                                obscureText: !state.isPasswordVisible,
                                focusNode: _passwordFocus,
                                textInputAction: TextInputAction.done,
                                validator: ValidatorService.validateSimpleField,
                                suffixIcon: PasswordVisibilityIcon(
                                  isVisible: state.isPasswordVisible,
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                      const AuthPasswordVisibilityToggled(),
                                    );
                                  },
                                ),
                                onFieldSubmitted: (_) => _signup(),
                              ),
                              SizedBox(height: 16.h(context)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 12.w(context),
                                    height: 12.w(context),
                                    child: Transform.scale(
                                      scale: 0.75,
                                      child: Checkbox(
                                        value: _acceptedTerms,
                                        onChanged: (value) {
                                          setState(() {
                                            _acceptedTerms = value ?? false;
                                          });
                                        },
                                        activeColor: LightThemeColors.darkBrown,
                                        checkColor: Colors.white,
                                        side: const BorderSide(
                                          color: Color(0xFFB6AAA0),
                                          width: 1.2,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4.r(context),
                                          ),
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w(context)),
                                  Expanded(
                                    child: Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Text(
                                          'I agree to the ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: const Color(0xFF8F837A),
                                                fontSize: 12.sp(context),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        GestureDetector(
                                          onTap: _openTermsAndConditions,
                                          child: Text(
                                            'Terms & Conditions',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color:
                                                      const Color(0xFF403731),
                                                  fontSize: 12.sp(context),
                                                  fontWeight: FontWeight.w500,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          '.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: const Color(0xFF8F837A),
                                                fontSize: 12.sp(context),
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h(context)),
                              CustomButton(
                                text: 'Signup',
                                onPressed: _signup,
                              ),
                              SizedBox(height: 24.h(context)),
                              const LoginDivider(),
                              SizedBox(height: 16.h(context)),
                              CustomButton(
                                text: 'Google',
                                prefixIcon: CrashSafeImage(
                                  Assets.images.google.keyName,
                                  width: 18.w(context),
                                  height: 18.h(context),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(height: 28.h(context)),
                              HaveAccountSestion(
                                label: "Already have an account?",
                                buttonText: "Login",
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  RoutesName.loginScreen,
                                ),
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
        },
      ),
    );
  }
}
