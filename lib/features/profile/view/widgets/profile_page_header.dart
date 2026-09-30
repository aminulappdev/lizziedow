import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w(context),
        vertical: 18.h(context),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: const Color(0xFF7E6E63),
              size: 28.sp(context),
            ),
          ),
          Expanded(
            child: Text(
              'Fertility Sisterhood',
              textAlign: TextAlign.center,
              style: MyFonts.playfairDisplay.copyWith(
                color: const Color(0xFF1F1A17),
                fontSize: 23.sp(context),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(
            Icons.notifications_none_outlined,
            color: const Color(0xFF7E6E63),
            size: 28.sp(context),
          ),
        ],
      ),
    );
  }
}
