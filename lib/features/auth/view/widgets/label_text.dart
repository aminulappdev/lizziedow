
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: MyFonts.dmSans.copyWith(
        color: const Color(0xFFC3C3C3),
        fontSize: 12.sp(context),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}