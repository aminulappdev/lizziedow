import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFC5B9AE), thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w(context)),
          child: Text(
            'or login with',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFC5B9AE),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFC5B9AE), thickness: 1)),
      ],
    );
  }
}