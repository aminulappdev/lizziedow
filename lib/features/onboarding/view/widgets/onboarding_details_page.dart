import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/model/onboarding_item.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_cards_slider.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_page_dots.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class OnboardingDetailsPage extends StatelessWidget {
  const OnboardingDetailsPage({
    super.key,
    required this.cards,
    required this.currentPage,
    required this.currentCard,
    required this.cardController,
  }); 

  final List<OnboardingItem> cards;
  final int currentPage;
  final int currentCard; 
  final PageController cardController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 50.h(context)),
        CrashSafeImage(
          Assets.images.logo.keyName,
          width: 160.w(context),
          height: 160.h(context),
        ),
        SizedBox(height: 80.h(context)),
        OnboardingCardsSlider(
          cards: cards,
          currentCard: currentCard,
          cardController: cardController,
        ),
        const Spacer(),
        OnboardingPageDots(currentPage: currentPage), 
        SizedBox(height: 18.h(context)),
        Text(
          'Feel more in control,\nevery day',
          textAlign: TextAlign.center,
          style: MyFonts.playfairDisplay.copyWith(
            fontSize: 32.sp(context),
            height: 0.9,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF403731),
          ),
        ),
        SizedBox(height: 12.h(context)),
        Text(
          'Simplify your fertility journey by bringing planning, tracking\nand budgeting together in one place',
          textAlign: TextAlign.center,
          style: MyFonts.dmSans.copyWith(
            fontSize: 11.5.sp(context),
            fontWeight: FontWeight.w600,
            color: const Color(0xFF7E6E63),
          ),
        ),
        SizedBox(height: 30.h(context)),
      ],
    );
  }
}
