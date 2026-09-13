import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_form_field.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_page_header.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_save_button.dart';

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
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const ProfilePageHeader(),
            Divider(
              height: 1.h(context),
              thickness: 1,
              color: Colors.white.withValues(alpha: 0.55),
            ),
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
                    style: MyFonts.instrumentSerif.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 24.sp(context),
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
                  ProfileFormField(
                    label: 'Current Password',
                    hintText: 'Enter your current password',
                    controller: _currentPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 18.h(context)),
                  ProfileFormField(
                    label: 'New Password',
                    hintText: 'Enter your new password',
                    controller: _newPasswordController,
                    obscureText: true,
                  ),
                  SizedBox(height: 18.h(context)),
                  ProfileFormField(
                    label: 'Confirm New Password',
                    hintText: 'Confirm your new password',
                    controller: _confirmPasswordController,
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                18.w(context),
                10.h(context),
                18.w(context),
                22.h(context),
              ),
              child: ProfileSaveButton(onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}
