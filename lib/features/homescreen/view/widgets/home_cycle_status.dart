import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class HomeCycleStatus extends StatelessWidget {
  const HomeCycleStatus({super.key});

  static const Color _textColor = Color(0xFF332A25);
  static const Color _mutedColor = Color(0xFF776B62);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Cycle Day 12',
          style: MyFonts.playfairDisplay.copyWith(
            color: _mutedColor,
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 12.w(context)),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99.r(context)),
            child: LinearProgressIndicator(
              minHeight: 4.h(context),
              value: 0.18,
              backgroundColor: Colors.white.withValues(alpha: 0.78),
              color: _textColor,
            ),
          ),
        ),
        SizedBox(width: 14.w(context)),
        Text(
          'Follicular phase',
          style: MyFonts.dmSans.copyWith(
            color: _mutedColor,
            fontSize: 11.sp(context),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
