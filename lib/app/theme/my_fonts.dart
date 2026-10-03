import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class MyFonts {
  static const String manropeFamily = 'Manrope';
  static const String dmSansFamily = 'DMSans';
  static const String instrumentSerifFamily = 'InstrumentSerif';
  static const String playfairDisplayFamily = 'PlayfairDisplay';

  static TextStyle get manrope => const TextStyle(fontFamily: manropeFamily);
  static TextStyle get dmSans => const TextStyle(fontFamily: dmSansFamily);
  static TextStyle get instrumentSerif =>
      const TextStyle(fontFamily: instrumentSerifFamily);
  static TextStyle get playfairDisplay =>
      const TextStyle(fontFamily: playfairDisplayFamily);
  static TextStyle get inter => dmSans;

  static TextStyle get appTextStyle => inter;

  static String get appFontFamily => dmSansFamily;

  static TextStyle get displayTextStyle => instrumentSerif;
  static TextStyle get bodyTextStyle => dmSans;
  static TextStyle get labelTextStyle => manrope;

  // Core typography scale.
  static double get heroLarge => AppResponsive.sp(32);
  static double get heroMedium => AppResponsive.sp(28);
  static double get headlineLarge => AppResponsive.sp(24);
  static double get headlineMedium => AppResponsive.sp(20);
  static double get bodyLarge => AppResponsive.sp(16);
  static double get bodyMedium => AppResponsive.sp(14);
  static double get caption => AppResponsive.sp(12);
  static double get chipSmall => AppResponsive.sp(10);

  // Backward-compatible aliases for existing usage.
  static double get appBarTittleSize => bodyLarge;
  static double get bodyMediumSize => bodyMedium;
  static double get primaryButtonTextSize => bodyLarge;
}
