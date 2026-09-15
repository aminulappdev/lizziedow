import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';

class PlannerState extends Equatable {
  const PlannerState({
    this.selectedTopFilterIndex = 0,
    this.selectedSectionFilterIndex = 0,
    this.selectedChecklistFilterIndex = 0,
    this.selectedTrackerFilterIndex = 0,
    this.topFilters = const [],
    this.sectionFilters = const [],
    this.checklistFilters = const [],
    this.trackerFilters = const [],
    this.calendarDays = const [],
    this.appointments = const [],
    this.medications = const [],
    this.journals = const [],
    this.checklistItems = const [],
    this.trackerMedicines = const [],
    this.trackerSupplements = const [],
    this.trackerMoods = const [],
    this.trackerSymptoms = const [],
    this.isCostAlreadyPaid = false,
  });

  final int selectedTopFilterIndex;
  final int selectedSectionFilterIndex;
  final int selectedChecklistFilterIndex;
  final int selectedTrackerFilterIndex;
  final List<String> topFilters;
  final List<String> sectionFilters;
  final List<String> checklistFilters;
  final List<String> trackerFilters;
  final List<PlannerCalendarDay> calendarDays;
  final List<PlannerAppointmentData> appointments;
  final List<PlannerMedicationData> medications;
  final List<PlannerJournalData> journals;
  final List<PlannerChecklistData> checklistItems;
  final List<PlannerTrackerMedicineData> trackerMedicines;
  final List<PlannerTrackerSupplementData> trackerSupplements;
  final List<String> trackerMoods;
  final List<String> trackerSymptoms;
  final bool isCostAlreadyPaid;

  PlannerState copyWith({
    int? selectedTopFilterIndex,
    int? selectedSectionFilterIndex,
    int? selectedChecklistFilterIndex,
    int? selectedTrackerFilterIndex,
    List<String>? topFilters,
    List<String>? sectionFilters,
    List<String>? checklistFilters,
    List<String>? trackerFilters,
    List<PlannerCalendarDay>? calendarDays,
    List<PlannerAppointmentData>? appointments,
    List<PlannerMedicationData>? medications,
    List<PlannerJournalData>? journals,
    List<PlannerChecklistData>? checklistItems,
    List<PlannerTrackerMedicineData>? trackerMedicines,
    List<PlannerTrackerSupplementData>? trackerSupplements,
    List<String>? trackerMoods,
    List<String>? trackerSymptoms,
    bool? isCostAlreadyPaid,
  }) {
    return PlannerState(
      selectedTopFilterIndex:
          selectedTopFilterIndex ?? this.selectedTopFilterIndex,
      selectedSectionFilterIndex:
          selectedSectionFilterIndex ?? this.selectedSectionFilterIndex,
      selectedChecklistFilterIndex:
          selectedChecklistFilterIndex ?? this.selectedChecklistFilterIndex,
      selectedTrackerFilterIndex:
          selectedTrackerFilterIndex ?? this.selectedTrackerFilterIndex,
      topFilters: topFilters ?? this.topFilters,
      sectionFilters: sectionFilters ?? this.sectionFilters,
      checklistFilters: checklistFilters ?? this.checklistFilters,
      trackerFilters: trackerFilters ?? this.trackerFilters,
      calendarDays: calendarDays ?? this.calendarDays,
      appointments: appointments ?? this.appointments,
      medications: medications ?? this.medications,
      journals: journals ?? this.journals,
      checklistItems: checklistItems ?? this.checklistItems,
      trackerMedicines: trackerMedicines ?? this.trackerMedicines,
      trackerSupplements: trackerSupplements ?? this.trackerSupplements,
      trackerMoods: trackerMoods ?? this.trackerMoods,
      trackerSymptoms: trackerSymptoms ?? this.trackerSymptoms,
      isCostAlreadyPaid: isCostAlreadyPaid ?? this.isCostAlreadyPaid,
    );
  }

  @override
  List<Object?> get props => [
    selectedTopFilterIndex,
    selectedSectionFilterIndex,
    selectedChecklistFilterIndex,
    selectedTrackerFilterIndex,
    topFilters,
    sectionFilters,
    checklistFilters,
    trackerFilters,
    calendarDays,
    appointments,
    medications,
    journals,
    checklistItems,
    trackerMedicines,
    trackerSupplements,
    trackerMoods,
    trackerSymptoms,
    isCostAlreadyPaid,
  ];
}
