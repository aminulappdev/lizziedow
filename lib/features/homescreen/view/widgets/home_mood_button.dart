import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class HomeMoodButton extends StatelessWidget {
  const HomeMoodButton({super.key, required this.mood});

  static const Color _textColor = Color(0xFF332A25);
  static const Color _dividerColor = Color(0xFFE8DDD0);

  final HomeMoodItem mood;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54.w(context), 
      child: Column(
        children: [
          Container(
            width: 50.w(context),
            height: 50.w(context),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 235, 220, 206),
              // border: Border.all(color: _dividerColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CrashSafeImage(
                mood.icon,
                width: 24.w(context),
                height: 24.h(context),
              ),
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            mood.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: MyFonts.dmSans.copyWith(
              color: _textColor,
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMoodItem {
  const HomeMoodItem({required this.label, required this.icon});

  final String label;
  final String icon;
}
