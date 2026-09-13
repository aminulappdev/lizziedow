import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ProfileFormField extends StatelessWidget {
  const ProfileFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF8F837A),
            fontSize: 11.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 7.h(context)),
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: MyFonts.dmSans.copyWith(
            color: LightThemeColors.darkBrown,
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyFonts.dmSans.copyWith(
              color: const Color(0xFF9A8E86),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w600,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w(context),
              vertical: 14.h(context),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r(context)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r(context)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r(context)),
              borderSide: const BorderSide(color: Color(0xFFB9A99B)),
            ),
          ),
        ),
      ],
    );
  }
}
