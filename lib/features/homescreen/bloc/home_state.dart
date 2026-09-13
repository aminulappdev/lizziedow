import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/homescreen/model/quick_action_data_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedFilterIndex = 1,
    this.filters = const [],
    this.quickCards = const [],
    this.medications = const [],
    this.appointments = const [],
    this.moods = const [],
    this.symptoms = const [],
  });

  final int selectedFilterIndex;
  final List<String> filters;
  final List<QuickActionCardDataModel> quickCards;
  final List<MedicationData> medications;
  final List<AppointmentData> appointments;
  final List<String> moods;
  final List<String> symptoms;

  HomeState copyWith({
    int? selectedFilterIndex,
    List<String>? filters,
    List<QuickActionCardDataModel>? quickCards,
    List<MedicationData>? medications,
    List<AppointmentData>? appointments,
    List<String>? moods,
    List<String>? symptoms,
  }) {
    return HomeState(
      selectedFilterIndex: selectedFilterIndex ?? this.selectedFilterIndex,
      filters: filters ?? this.filters,
      quickCards: quickCards ?? this.quickCards,
      medications: medications ?? this.medications,
      appointments: appointments ?? this.appointments,
      moods: moods ?? this.moods,
      symptoms: symptoms ?? this.symptoms,
    );
  }

  @override
  List<Object?> get props => [
    selectedFilterIndex,
    filters,
    quickCards,
    medications,
    appointments,
    moods,
    symptoms,
  ];
}
