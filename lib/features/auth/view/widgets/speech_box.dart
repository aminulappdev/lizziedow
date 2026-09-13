import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class SpeechBox extends StatelessWidget {
  const SpeechBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w(context),
        vertical: 14.h(context),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.r(context)),
        border: Border.all(color: Colors.white.withOpacity(0.65)),
      ),
      child: Text(
        '"Believe In The Power Of Your Body, The Wisdom Of Your Heart, And The Resilience Of Your Spirit."',
        textAlign: TextAlign.center,
        style: MyFonts.instrumentSerif.copyWith(
          color: const Color(0xFF6F6258),
          fontSize: 13.sp(context),
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}