import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    required this.currentPage,
    required this.currentCard,
  });

  final int currentPage;
  final int currentCard;

  OnboardingState copyWith({
    int? currentPage,
    int? currentCard,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      currentCard: currentCard ?? this.currentCard,
    );
  }

  @override
  List<Object> get props => [currentPage, currentCard];
}
