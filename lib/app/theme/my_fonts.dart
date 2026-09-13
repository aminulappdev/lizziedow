import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class MyFonts {
  static TextStyle get manrope => GoogleFonts.manrope();
  static TextStyle get dmSans => GoogleFonts.dmSans();
  static TextStyle get instrumentSerif => GoogleFonts.instrumentSerif();
  static TextStyle get inter => GoogleFonts.inter();

  static TextStyle get appTextStyle => inter;

  static String get appFontFamily => appTextStyle.fontFamily ?? 'Inter';

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
