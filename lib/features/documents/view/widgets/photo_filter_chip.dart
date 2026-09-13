import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class PhotoFilterChip extends StatelessWidget {
  const PhotoFilterChip({
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
        padding: EdgeInsets.symmetric(
          horizontal: 16.w(context),
          vertical: 12.h(context),
        ),
        decoration: BoxDecoration(
          color: isSelected ? LightThemeColors.buttonColor : Colors.white,
          borderRadius: BorderRadius.circular(100.r(context)),
          border: Border.all(color: const Color(0xFFF1EAE4)),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: MyFonts.dmSans.copyWith(
            color: isSelected ? Colors.white : const Color(0xFF7E756F),
            fontSize: 10.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
