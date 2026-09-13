import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/planner/bloc/planner_event.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/repository/planner_repository.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc({PlannerRepository plannerRepository = const PlannerRepository()})
    : _plannerRepository = plannerRepository,
      super(const PlannerState()) {
    on<PlannerStartedEvent>(_onPlannerStarted);
    on<PlannerTopFilterChangedEvent>(_onPlannerTopFilterChanged);
    on<PlannerSectionFilterChangedEvent>(_onPlannerSectionFilterChanged);
    on<PlannerChecklistFilterChangedEvent>(_onPlannerChecklistFilterChanged);
    on<PlannerTrackerFilterChangedEvent>(_onPlannerTrackerFilterChanged);
  }

  final PlannerRepository _plannerRepository;

  void _onPlannerStarted(
    PlannerStartedEvent event,
    Emitter<PlannerState> emit,
  ) {
    emit(
      state.copyWith(
        topFilters: _plannerRepository.topFilters,
        sectionFilters: _plannerRepository.sectionFilters,
        checklistFilters: _plannerRepository.checklistFilters,
        trackerFilters: _plannerRepository.trackerFilters,
        calendarDays: _plannerRepository.calendarDays,
        appointments: _plannerRepository.appointments,
        medications: _plannerRepository.medications,
        journals: _plannerRepository.journals,
        checklistItems: _plannerRepository.checklistItems,
        trackerMedicines: _plannerRepository.trackerMedicines,
        trackerMoods: _plannerRepository.trackerMoods,
        trackerSymptoms: _plannerRepository.trackerSymptoms,
      ),
    );
  }

  void _onPlannerTopFilterChanged(
    PlannerTopFilterChangedEvent event,
    Emitter<PlannerState> emit,
  ) {
    emit(state.copyWith(selectedTopFilterIndex: event.index));
  }

  void _onPlannerSectionFilterChanged(
    PlannerSectionFilterChangedEvent event,
    Emitter<PlannerState> emit,
  ) {
    emit(state.copyWith(selectedSectionFilterIndex: event.index));
  }

  void _onPlannerChecklistFilterChanged(
    PlannerChecklistFilterChangedEvent event,
    Emitter<PlannerState> emit,
  ) {
    emit(state.copyWith(selectedChecklistFilterIndex: event.index));
  }

  void _onPlannerTrackerFilterChanged(
    PlannerTrackerFilterChangedEvent event,
    Emitter<PlannerState> emit,
  ) {
    emit(state.copyWith(selectedTrackerFilterIndex: event.index));
  }
}
