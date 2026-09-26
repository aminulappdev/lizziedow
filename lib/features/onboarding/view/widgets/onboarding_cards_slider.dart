import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_event.dart';
import 'package:lizziedow/features/onboarding/model/onboarding_item.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_card.dart';

class OnboardingCardsSlider extends StatelessWidget {
  const OnboardingCardsSlider({
    super.key,
    required this.cards,
    required this.currentCard,
    required this.cardController, 
  }); 

  final List<OnboardingItem> cards; 
  final int currentCard;
  final PageController cardController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h(context),
      width: double.infinity,
      child: PageView.builder(
        controller: cardController,
        clipBehavior: Clip.none,
        onPageChanged: (index) {
          final cardIndex = index % cards.length;

          context.read<OnboardingBloc>().add(
            OnboardingCardChanged(cardIndex: cardIndex),
          );
        },
        itemBuilder: (context, index) {
          final cardIndex = index % cards.length;
          final isActive = currentCard == cardIndex;

          return AnimatedPadding(
            duration: const Duration(milliseconds: 220),
            padding: EdgeInsets.only(
              top: isActive ? 0 : 42.h(context),
              bottom: isActive ? 45.h(context) : 0,
            ),
            child: Center(
              child: OnboardingCard(
                item: cards[cardIndex],
                isSideCard: !isActive,
              ),
            ),
          );
        },
      ),
    );
  }
}
