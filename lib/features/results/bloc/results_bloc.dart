import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_event.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/repository/results_repository.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc({ResultsRepository resultsRepository = const ResultsRepository()})
    : _resultsRepository = resultsRepository,
      super(const ResultsState()) {
    on<ResultsStartedEvent>(_onResultsStarted);
    on<ResultsTopFilterChangedEvent>(_onResultsTopFilterChanged);
    on<ResultsHormoneChangedEvent>(_onResultsHormoneChanged);
    on<ResultsNoteFilterChangedEvent>(_onResultsNoteFilterChanged);
    on<ResultsSubmittedEvent>(_onResultsSubmitted);
    on<ResultQuestionAddedEvent>(_onResultQuestionAdded);
    on<ResultNoteAddedEvent>(_onResultNoteAdded);
  }

  final ResultsRepository _resultsRepository;

  void _onResultsStarted(
    ResultsStartedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(
      state.copyWith(
        topFilters: _resultsRepository.topFilters,
        noteFilters: _resultsRepository.noteFilters,
        hormones: _resultsRepository.hormones,
        totalReportCount: _resultsRepository.totalReportCount,
        totalNotesCount: _resultsRepository.totalNotesCount,
        totalQuestionsCount: _resultsRepository.totalQuestionsCount,
        reports: _resultsRepository.reports,
        notes: _resultsRepository.notes,
        questions: _resultsRepository.questions,
      ),
    );
  }

  void _onResultsTopFilterChanged(
    ResultsTopFilterChangedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(selectedTopFilterIndex: event.index));
  }

  void _onResultsHormoneChanged(
    ResultsHormoneChangedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(selectedHormoneIndex: event.index));
  }

  void _onResultsNoteFilterChanged(
    ResultsNoteFilterChangedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(selectedNoteFilterIndex: event.index));
  }

  void _onResultsSubmitted(
    ResultsSubmittedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(savedResults: [event.result, ...state.savedResults]));
  }

  void _onResultQuestionAdded(
    ResultQuestionAddedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(questions: [event.question, ...state.questions]));
  }

  void _onResultNoteAdded(
    ResultNoteAddedEvent event,
    Emitter<ResultsState> emit,
  ) {
    emit(state.copyWith(notes: [event.note, ...state.notes]));
  }
}
