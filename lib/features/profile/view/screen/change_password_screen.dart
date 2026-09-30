import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/auth/view/widgets/label_text.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/profile/bloc/profile_bloc.dart';
import 'package:lizziedow/features/profile/bloc/profile_event.dart';
import 'package:lizziedow/features/profile/bloc/profile_state.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_page_header.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: LightThemeColors.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  const ProfilePageHeader(),
                 
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w(context),
                        vertical: 24.h(context),
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Change Password',
                          style: MyFonts.playfairDisplay.copyWith(
                            color: LightThemeColors.darkBrown,
                            fontSize: 20.sp(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6.h(context)),
                        Text(
                          'update username and email address of your account',
                          style: MyFonts.dmSans.copyWith(
                            color: const Color(0xFF6F6761),
                            fontSize: 12.sp(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 24.h(context)),
                        LabelText(label: 'Current Password', color: const Color(0xFF7B6654)),
                        SizedBox(height: 7.h(context)),
                        CustomTextField(
                          hintText: 'Enter your current password',
                          controller: _currentPasswordController,
                          obscureText: !state.isCurrentPasswordVisible,
                          suffixIcon: _PasswordVisibilityIcon(
                            isVisible: state.isCurrentPasswordVisible,
                            onTap: () {
                              context.read<ProfileBloc>().add(
                                const ProfileCurrentPasswordVisibilityToggledEvent(),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 18.h(context)),
                        LabelText(label: 'New Password', color: const Color(0xFF7B6654)),
                        SizedBox(height: 7.h(context)),
                        CustomTextField(
                          hintText: 'Enter your new password',
                          controller: _newPasswordController,
                          obscureText: !state.isNewPasswordVisible,
                          suffixIcon: _PasswordVisibilityIcon(
                            isVisible: state.isNewPasswordVisible,
                            onTap: () {
                              context.read<ProfileBloc>().add(
                                const ProfileNewPasswordVisibilityToggledEvent(),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 18.h(context)),
                        LabelText(label: 'Confirm New Password', color: const Color(0xFF7B6654)),
                        SizedBox(height: 7.h(context)),
                        CustomTextField(
                          hintText: 'Confirm your new password',
                          controller: _confirmPasswordController,
                          obscureText: !state.isConfirmPasswordVisible,
                          suffixIcon: _PasswordVisibilityIcon(
                            isVisible: state.isConfirmPasswordVisible,
                            onTap: () {
                              context.read<ProfileBloc>().add(
                                const ProfileConfirmPasswordVisibilityToggledEvent(),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.w(context)),
                    child: CustomButton(
                      text: 'Save Changes',
                      onPressed: () => Navigator.pop(context),
                      borderRadius: 12,
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
}

class _PasswordVisibilityIcon extends StatelessWidget {
  const _PasswordVisibilityIcon({
    required this.isVisible,
    required this.onTap,
  });

  final bool isVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isVisible
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        size: 18.sp(context),
        color: const Color(0xFF6F6761),
      ),
    );
  }
}
