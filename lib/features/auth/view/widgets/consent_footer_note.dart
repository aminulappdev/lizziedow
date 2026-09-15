import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ConsentFooterNote extends StatelessWidget {
  const ConsentFooterNote({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline,
          color: const Color(0xFF9A8E86),
          size: 14.sp(context),
        ),
        SizedBox(width: 8.w(context)),
        Expanded(
          child: Text(
            text,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w600,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
