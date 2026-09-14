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
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/auth/view/widgets/login_design_layer.dart';
import 'package:lizziedow/features/auth/view/widgets/password_visibility_icon.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class SetPasswordPage extends StatefulWidget {
  const SetPasswordPage({super.key});

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _setPassword() {
    //if (_formKey.currentState?.validate() ?? false) {
      Navigator.pushNamed(context, RoutesName.loginScreen);
   //  }
  }

  String? _validateConfirmPassword(String? value) {
    return ValidatorService.validateConfirmPassword(
      value,
      _passwordController.text,
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
                                title: 'Set password',
                                subtitle:
                                    'Create a new password for your account',
                                titleTopSpacing: 92,
                              ),
                              SizedBox(height: 34.h(context)),
                              const LabelText(label: 'Password'),
                              SizedBox(height: 6.h(context)),
                              CustomTextField(
                                controller: _passwordController,
                                label: 'Password',
                                hintText: 'Enter your password',
                                obscureText: !state.isPasswordVisible,
                                focusNode: _passwordFocus,
                                textInputAction: TextInputAction.next,
                                validator: ValidatorService.validateSimpleField,
                                suffixIcon: PasswordVisibilityIcon(
                                  isVisible: state.isPasswordVisible,
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                      const AuthPasswordVisibilityToggled(),
                                    );
                                  },
                                ),
                                onFieldSubmitted: (_) {
                                  _confirmPasswordFocus.requestFocus();
                                },
                              ),
                              SizedBox(height: 14.h(context)),
                              const LabelText(label: 'Confirm Password'),
                              SizedBox(height: 6.h(context)),
                              CustomTextField(
                                controller: _confirmPasswordController,
                                label: 'Confirm Password',
                                hintText: 'Enter your confirm password',
                                obscureText: !state.isConfirmPasswordVisible,
                                focusNode: _confirmPasswordFocus,
                                textInputAction: TextInputAction.done,
                                validator: _validateConfirmPassword,
                                suffixIcon: PasswordVisibilityIcon(
                                  isVisible: state.isConfirmPasswordVisible,
                                  onTap: () {
                                    context.read<AuthBloc>().add(
                                      const AuthConfirmPasswordVisibilityToggled(),
                                    );
                                  },
                                ),
                                onFieldSubmitted: (_) => _setPassword(),
                              ),
                              SizedBox(height: 24.h(context)),
                              CustomButton(
                                text: 'Submit',
                                onPressed: _setPassword,
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
