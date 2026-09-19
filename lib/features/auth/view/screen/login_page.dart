import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/auth/bloc/auth_bloc.dart';
import 'package:lizziedow/features/auth/bloc/auth_event.dart';
import 'package:lizziedow/features/auth/bloc/auth_state.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/auth/view/widgets/have_account.dart';
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/auth/view/widgets/login_design_layer.dart';
import 'package:lizziedow/features/auth/view/widgets/login_devider.dart';
import 'package:lizziedow/features/auth/view/widgets/password_visibility_icon.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.pushReplacementNamed(context, RoutesName.setTypeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        listener: (context, state) {
          if (state.postApiStatus == AuthPostApiStatus.error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }

          if (state.postApiStatus == AuthPostApiStatus.success) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Login success')));
            Navigator.pushReplacementNamed(context, RoutesName.setTypeScreen);
          }
        },
        builder: (context, state) {
          final isLoading = state.postApiStatus == AuthPostApiStatus.loading;

          return SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          LoginDesignLayer(titleTopSpacing: 50.h(context)),
                          SizedBox(height: 24.h(context)),
                          LabelText(label: 'Email'),
                          SizedBox(height: 6.h(context)),
                          CustomTextField(
                            controller: _emailController,
                            label: 'Email',
                            hintText: 'Enter your email address',
                            keyboardType: TextInputType.emailAddress,
                            focusNode: _emailFocus,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                AuthEmailChanged(value.trim()),
                              );
                            },
                            onFieldSubmitted: (_) {
                              _passwordFocus.requestFocus();
                            },
                          ),
                          SizedBox(height: 14.h(context)),
                          LabelText(label: 'Password'),
                          SizedBox(height: 6.h(context)),
                          CustomTextField(
                            controller: _passwordController,
                            label: 'Password',
                            hintText: 'Enter your password',
                            obscureText: !state.isPasswordVisible,
                            focusNode: _passwordFocus,
                            textInputAction: TextInputAction.done,
                            suffixIcon: PasswordVisibilityIcon(
                              isVisible: state.isPasswordVisible,
                              onTap: () {
                                context.read<AuthBloc>().add(
                                  const AuthPasswordVisibilityToggled(),
                                );
                              },
                            ),
                            onChanged: (value) {
                              context.read<AuthBloc>().add(
                                AuthPasswordChanged(value),
                              );
                            },
                            onFieldSubmitted: (_) => _login(),
                          ),
                          SizedBox(height: 10.h(context)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () => Navigator.pushNamed(
                                      context,
                                      RoutesName.forgotPasswordScreen,
                                    ),
                              child: Text(
                                'Forgot password?',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: const Color(0xFF757575),
                                      fontSize: 12.sp(context),
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h(context)),
                          CustomButton(
                            text: isLoading ? 'Loading...' : 'Login',
                            onPressed: isLoading ? null : _login,
                          ),
                          SizedBox(height: 24.h(context)),
                          LoginDivider(),
                          SizedBox(height: 16.h(context)),
                          CustomButton(
                            text: 'Google',
                            prefixIcon: CrashSafeImage(
                              Assets.images.google.keyName,
                              width: 18.w(context),
                              height: 18.h(context),
                            ),
                            onPressed: isLoading ? null : () {},
                          ),
                          SizedBox(height: 28.h(context)),
                          HaveAccountSestion(
                            label: "Don't have an account?",
                            buttonText: "Register",
                            onPressed: () => Navigator.pushNamed(
                              context,
                              RoutesName.signupScreen,
                            ),
                          ),
                          SizedBox(height: 28.h(context)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
