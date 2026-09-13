import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/homescreen/bloc/home_event.dart';
import 'package:lizziedow/features/homescreen/bloc/home_state.dart';
import 'package:lizziedow/features/homescreen/repository/home_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({HomeRepository homeRepository = const HomeRepository()})
    : _homeRepository = homeRepository,
      super(const HomeState()) {
    on<HomeStartedEvent>(_onHomeStarted);
    on<HomeFilterChangedEvent>(_onHomeFilterChanged);
  }

  final HomeRepository _homeRepository;

  void _onHomeStarted(
    HomeStartedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        filters: _homeRepository.filters,
        quickCards: _homeRepository.quickCards,
        medications: _homeRepository.medications,
        appointments: _homeRepository.appointments,
        moods: _homeRepository.moods,
        symptoms: _homeRepository.symptoms,
      ),
    );
  }

  void _onHomeFilterChanged(
    HomeFilterChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedFilterIndex: event.index));
  }
}
