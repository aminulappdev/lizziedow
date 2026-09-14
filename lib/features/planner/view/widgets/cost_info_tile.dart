import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CostInfoTile extends StatelessWidget {
  const CostInfoTile({
    super.key,
    required this.icon,
    required this.title,
    required this.amount,
  });

  final IconData icon;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h(context),
      padding: EdgeInsets.symmetric(horizontal: 10.w(context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF8A7C72),
            size: 18.sp(context),
          ),
          SizedBox(width: 6.w(context)),
          Expanded(
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8A7C72),
                  fontSize: 9.sp(context),
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(text: '$title  '),
                  TextSpan(
                    text: amount,
                    style: MyFonts.dmSans.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 10.sp(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: const Color(0xFF8A7C72),
            size: 16.sp(context),
          ),
        ],
      ),
    );
  }
}
