import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_form_field.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_page_header.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_save_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
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
                    'Edit Profile',
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
                    label: 'Username',
                    hintText: 'Enter your username',
                    controller: _usernameController,
                  ),
                  SizedBox(height: 18.h(context)),
                  ProfileFormField(
                    label: 'Email',
                    hintText: 'Enter your email address',
                    controller: _emailController,
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
