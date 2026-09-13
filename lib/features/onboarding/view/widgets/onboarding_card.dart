import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/model/onboarding_item.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.item,
    this.isSideCard = false,
  });

  final OnboardingItem item;
  final bool isSideCard;

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: (isSideCard ? 210 : 210).w(context),
      height: (isSideCard ? 220 : 240).h(context),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF8),
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: (isSideCard ? 14 : 22).w(context),
        vertical: (isSideCard ? 14 : 20).h(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.number,
            style: MyFonts.instrumentSerif.copyWith(
              fontSize: (isSideCard ? 20 : 30).sp(context),
              fontWeight: FontWeight.w500,
              color: const Color(0xFF9B8B7F),
            ),
          ),
          SizedBox(height: (isSideCard ? 8 : 14).h(context)),
          Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: MyFonts.instrumentSerif.copyWith(
              fontSize: (isSideCard ? 16 : 24).sp(context),
              height: 1,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF403731),
            ),
          ),
          SizedBox(height: (isSideCard ? 8 : 14).h(context)),
          Text(
            item.description,
            textAlign: TextAlign.center,
            maxLines: isSideCard ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: MyFonts.dmSans.copyWith(
              fontSize: (isSideCard ? 10 : 12).sp(context),
              height: 1.25,
              color: const Color(0xFF9B8B7F),
            ),
          ),
        ],
      ),
    );
  }
}
