
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class HaveAccountSestion extends StatelessWidget {
  const HaveAccountSestion({
    super.key,
    required this.label,
    required this.buttonText,
    this.onPressed,
  });
  final String label;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
   Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            label,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFC5B9AE),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              buttonText,
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF403731),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}