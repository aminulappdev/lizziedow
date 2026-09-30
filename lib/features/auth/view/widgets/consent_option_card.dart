import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ConsentOptionCard extends StatelessWidget {
  const ConsentOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        14.w(context),
        14.h(context),
        10.w(context),
        14.h(context),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF5F1),
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w(context),
            height: 36.h(context),
            decoration: const BoxDecoration(
              color: Color(0xFFF1E8E0),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: const Color(0xFF8A7C72),
              size: 18.sp(context),
            ),
          ),
          SizedBox(width: 12.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MyFonts.playfairDisplay.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h(context)),
                Text(
                  description,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF8F837A),
                    fontSize: 10.sp(context),
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w(context)),
          SizedBox(
            width: 14.w(context),
            height: 14.h(context),
            child: Transform.scale(
              scale: 0.75,
              child: Checkbox(
                value: value,
                activeColor: LightThemeColors.buttonColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: const BorderSide(color: Color(0xFFB9A99B)),
                onChanged: (checked) => onChanged(checked ?? false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
