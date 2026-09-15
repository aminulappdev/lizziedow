import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/bloc/profile_bloc.dart';
import 'package:lizziedow/features/profile/bloc/profile_event.dart';
import 'package:lizziedow/features/profile/bloc/profile_state.dart';
import 'package:lizziedow/features/profile/repository/profile_repository.dart';
import 'package:lizziedow/features/profile/view/widgets/contact_support_bottom_sheet.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_confirmation_bottom_sheet.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_header_card.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_menu_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(const ProfileStartedEvent()),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w(context),
              vertical: 28.h(context),
            ).copyWith(bottom: 18.h(context)),
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileHeaderCard(user: state.user),
              SizedBox(height: 20.h(context)),
              ProfileMenuCard(
                items: state.menuItems,
                onSelected: (index) {
                  context.read<ProfileBloc>().add(
                    ProfileMenuItemSelectedEvent(index),
                  );
                  _handleMenuSelection(context, index);
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleMenuSelection(BuildContext context, int index) {
    const profileRepository = ProfileRepository();

    switch (index) {
      case 0:
        Navigator.pushNamed(context, RoutesName.editProfileScreen);
        break;
      case 1:
        Navigator.pushNamed(context, RoutesName.changePasswordScreen);
        break;
      case 4:
        Navigator.pushNamed(
          context,
          RoutesName.profileInfoScreen,
          arguments: {
            'header': 'Terms & Conditions',
            'data': profileRepository.termsConditions,
          },
        );
        break;
      case 5:
        Navigator.pushNamed(
          context,
          RoutesName.profileInfoScreen,
          arguments: {
            'header': 'Privacy Policy',
            'data': profileRepository.privacyPolicy,
          },
        );
        break;
      case 6:
        _showContactSupportBottomSheet(context);
        break;
      case 7:
        _showDeleteAccountConfirmationBottomSheet(context);
        break;
      case 8:
        _showLogoutConfirmationBottomSheet(context);
        break;
      default:
        break;
    }
  }

  void _showContactSupportBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r(context)),
        ),
      ),
      builder: (_) => const ContactSupportBottomSheet(),
    );
  }

  void _showLogoutConfirmationBottomSheet(BuildContext context) {
    _showProfileConfirmationBottomSheet(
      context,
      actionText: 'Logout',
      message:
          'Are you sure you want to logout from your account?\nto gain access you need to login again.',
      onAction: (bottomSheetContext) {
        Navigator.pop(bottomSheetContext);
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginScreen,
          (route) => false,
        );
      },
    );
  }

  void _showDeleteAccountConfirmationBottomSheet(BuildContext context) {
    _showProfileConfirmationBottomSheet(
      context,
      actionText: 'Delete Account',
      message:
          'Are you sure you want to delete your account?\nThis action cannot be undone.',
      onAction: (bottomSheetContext) {
        Navigator.pop(bottomSheetContext);
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginScreen,
          (route) => false,
        );
      },
    );
  }

  void _showProfileConfirmationBottomSheet(
    BuildContext context, {
    required String actionText,
    required String message,
    required ValueChanged<BuildContext> onAction,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r(context)),
        ),
      ),
      builder: (bottomSheetContext) {
        return ProfileConfirmationBottomSheet(
          title: 'Are You Sure?',
          message: message,
          actionText: actionText,
          onAction: () => onAction(bottomSheetContext),
        );
      },
    );
  }
}
