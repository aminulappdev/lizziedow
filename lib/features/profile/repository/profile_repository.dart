import 'package:flutter/material.dart';
import 'package:lizziedow/features/profile/model/profile_model.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class ProfileRepository {
  const ProfileRepository();

  ProfileUserData get user => const ProfileUserData(
    name: 'Kristin Watson',
    email: 'donghoang87h@gmail.com',
    initials: 'KW',
  );

  List<ProfileMenuItemData> get menuItems =>  [
    ProfileMenuItemData(
      title: 'Edit Profile',
      icon: Assets.images.person.path,
    ),
    ProfileMenuItemData( 
      title: 'Change Password',
      icon: Assets.images.keyIcon.path,
    ),
    ProfileMenuItemData(
      title: 'Export Profile Data',
      icon: Assets.images.fileExport.path,
    ),
    ProfileMenuItemData(
      title: 'Join Our Community',
      icon: Assets.images.whatsapp.path,
    ),
    ProfileMenuItemData(
      title: 'Terms & Conditions',
      icon: Assets.images.quetions.path,
    ),
    ProfileMenuItemData(
      title: 'Privacy Policy',
      icon: Assets.images.quetions.path,
    ),
    ProfileMenuItemData(
      title: 'Contact Support',
      icon: Assets.images.quetions.path,
    ),
    ProfileMenuItemData(
      title: 'Delete Account',
      icon: Assets.images.delete.path,
    ),
    ProfileMenuItemData(
      title: 'Logout',
      icon: Assets.images.logout.path,
      isDestructive: true,
    ),
  ];

  String get termsConditions => '''
Welcome to Fertility Sisterhood. By using this app, you agree to use it for personal tracking, education, and organization only.

Your planner, results, documents, notes, and profile tools are designed to help you keep fertility journey information in one place. The app does not replace medical advice, diagnosis, or treatment from a qualified healthcare professional.

You are responsible for keeping your account details accurate and protecting access to your device and account. Do not upload or share information that you do not have permission to store.

We may update these terms from time to time to improve clarity, safety, or app functionality. Continued use of the app means you accept the latest version.
''';

  String get privacyPolicy => '''
Your privacy matters. Fertility Sisterhood is designed to help you store sensitive fertility-related information with care.

The app may collect profile details, planner entries, test result information, notes, documents, and photos that you choose to add. This information is used to provide the app experience, organize your records, and support your account.

We do not sell your personal health information. Access to your information should remain under your control, and you can request support for account or data concerns through the Contact Support option.

Please avoid sharing your login details. If you believe your account is at risk, change your password and contact support as soon as possible.
''';
}
