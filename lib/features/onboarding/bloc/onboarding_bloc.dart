import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_event.dart';
import 'package:lizziedow/features/onboarding/bloc/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(const OnboardingState(currentPage: 0, currentCard: 0)) {
    on<OnboardingPageChanged>(_onPageChanged);
    on<OnboardingCardChanged>(_onCardChanged);
  }

  void _onPageChanged(
    OnboardingPageChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  void _onCardChanged(
    OnboardingCardChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(currentCard: event.cardIndex));
  }
}
