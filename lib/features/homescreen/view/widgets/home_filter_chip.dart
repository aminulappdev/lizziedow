import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class HomeFilterChip extends StatelessWidget {
  const HomeFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label; 
  final bool isSelected;
  final VoidCallback onTap;

  @override  
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 14.w(context),
          vertical: 10.h(context),
        ),
        decoration: BoxDecoration(
          color: isSelected ? LightThemeColors.buttonColor : Color(0xFFF6F0EB),
          borderRadius: BorderRadius.circular(100.r(context)),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: MyFonts.dmSans.copyWith(
            color: isSelected ? Colors.white : const Color(0xFF7E756F),
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
