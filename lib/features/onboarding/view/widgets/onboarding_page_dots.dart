import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class OnboardingPageDots extends StatelessWidget {
  const OnboardingPageDots({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        final isActive = currentPage == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 3.w(context)),
          width: (isActive ? 7 : 6).w(context),
          height: (isActive ? 7 : 6).h(context),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? const Color(0xFF403731)
                : const Color(0xFFD8DED8),
          ),
        );
      }),
    );
  }
}
