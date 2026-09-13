import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/routes_name.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_event.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_state.dart';
import 'package:lizziedow/features/onboarding/model/onboarding_item.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_details_page.dart';
import 'package:lizziedow/features/onboarding/view/widgets/onboarding_welcome_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final PageController _cardController = PageController(
    initialPage: 3000,
    viewportFraction: 0.62,
  );

  final List<OnboardingItem> _cards = const [
    OnboardingItem(
      number: '01',
      title: 'Set up your cycle',
      description:
          'Enter baseline dates, and medication schedule. Fertility Sisterhood builds your personalised timeline.',
    ),
    OnboardingItem(
      number: '02',
      title: 'Track medication',
      description:
          'Log medication, appointment dates and important reminders in one place.',
    ),
    OnboardingItem(
      number: '03',
      title: 'Build a plan',
      description:
          'See what is coming next and keep your fertility journey easier to follow.',
    ),
  ];

  @override
  void dispose() {
    _cardController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.pushNamed(context, RoutesName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4EBDD),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w(context)),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<OnboardingBloc, OnboardingState>(
                    builder: (context, state) {
                      return PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          context.read<OnboardingBloc>().add(
                            OnboardingPageChanged(pageIndex: index),
                          );
                        },
                        children: [
                          OnboardingWelcomePage(currentPage: state.currentPage),
                          OnboardingDetailsPage(
                            cards: _cards,
                            currentPage: state.currentPage,
                            currentCard: state.currentCard,
                            cardController: _cardController,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                CustomButton(text: 'Start Your Journey', onPressed: _goToLogin),
                SizedBox(height: 22.h(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
