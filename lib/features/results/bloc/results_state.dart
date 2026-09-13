import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

class ResultsState extends Equatable {
  const ResultsState({
    this.selectedTopFilterIndex = 0,
    this.selectedHormoneIndex = 0,
    this.selectedNoteFilterIndex = 0,
    this.totalReportCount = 0,
    this.totalNotesCount = 0,
    this.totalQuestionsCount = 0,
    this.topFilters = const [],
    this.noteFilters = const [],
    this.hormones = const [],
    this.reports = const [],
    this.notes = const [],
    this.questions = const [],
    this.savedResults = const [],
  });

  final int selectedTopFilterIndex;
  final int selectedHormoneIndex;
  final int selectedNoteFilterIndex;
  final int totalReportCount;
  final int totalNotesCount;
  final int totalQuestionsCount;
  final List<String> topFilters;
  final List<String> noteFilters;
  final List<String> hormones;
  final List<ResultReportData> reports;
  final List<ResultNoteData> notes;
  final List<ResultQuestionData> questions;
  final List<HormoneResultData> savedResults;

  ResultsState copyWith({
    int? selectedTopFilterIndex,
    int? selectedHormoneIndex,
    int? selectedNoteFilterIndex,
    int? totalReportCount,
    int? totalNotesCount,
    int? totalQuestionsCount,
    List<String>? topFilters,
    List<String>? noteFilters,
    List<String>? hormones,
    List<ResultReportData>? reports,
    List<ResultNoteData>? notes,
    List<ResultQuestionData>? questions,
    List<HormoneResultData>? savedResults,
  }) {
    return ResultsState(
      selectedTopFilterIndex:
          selectedTopFilterIndex ?? this.selectedTopFilterIndex,
      selectedHormoneIndex: selectedHormoneIndex ?? this.selectedHormoneIndex,
      selectedNoteFilterIndex:
          selectedNoteFilterIndex ?? this.selectedNoteFilterIndex,
      totalReportCount: totalReportCount ?? this.totalReportCount,
      totalNotesCount: totalNotesCount ?? this.totalNotesCount,
      totalQuestionsCount: totalQuestionsCount ?? this.totalQuestionsCount,
      topFilters: topFilters ?? this.topFilters,
      noteFilters: noteFilters ?? this.noteFilters,
      hormones: hormones ?? this.hormones,
      reports: reports ?? this.reports,
      notes: notes ?? this.notes,
      questions: questions ?? this.questions,
      savedResults: savedResults ?? this.savedResults,
    );
  }

  @override
  List<Object?> get props => [
    selectedTopFilterIndex,
    selectedHormoneIndex,
    selectedNoteFilterIndex,
    totalReportCount,
    totalNotesCount,
    totalQuestionsCount,
    topFilters,
    noteFilters,
    hormones,
    reports,
    notes,
    questions,
    savedResults,
  ];
}
