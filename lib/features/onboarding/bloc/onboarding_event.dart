import 'package:equatable/equatable.dart';

class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingPageChanged extends OnboardingEvent {
  const OnboardingPageChanged({required this.pageIndex});

  final int pageIndex;

  @override
  List<Object> get props => [pageIndex]; 
}

class OnboardingCardChanged extends OnboardingEvent {
  const OnboardingCardChanged({required this.cardIndex});

  final int cardIndex;

  @override
  List<Object> get props => [cardIndex];
}
