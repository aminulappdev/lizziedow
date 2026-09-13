import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/bloc/profile_bloc.dart';
import 'package:lizziedow/features/profile/bloc/profile_event.dart';
import 'package:lizziedow/features/profile/bloc/profile_state.dart';
import 'package:lizziedow/features/profile/repository/profile_repository.dart';
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

    if (index == 0) {
      Navigator.pushNamed(context, RoutesName.editProfileScreen);
    }

    if (index == 1) {
      Navigator.pushNamed(context, RoutesName.changePasswordScreen);
    }

    if (index == 4) {
      Navigator.pushNamed(
        context,
        RoutesName.profileInfoScreen,
        arguments: {
          'header': 'Terms & Conditions',
          'data': profileRepository.termsConditions,
        },
      );
    }

    if (index == 5) {
      Navigator.pushNamed(
        context,
        RoutesName.profileInfoScreen,
        arguments: {
          'header': 'Privacy Policy',
          'data': profileRepository.privacyPolicy,
        },
      );
    }
  }
}
