import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

sealed class ResultsEvent extends Equatable {
  const ResultsEvent();

  @override
  List<Object?> get props => [];
}

class ResultsStartedEvent extends ResultsEvent {
  const ResultsStartedEvent();
}

class ResultsTopFilterChangedEvent extends ResultsEvent {
  const ResultsTopFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ResultsHormoneChangedEvent extends ResultsEvent {
  const ResultsHormoneChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ResultsNoteFilterChangedEvent extends ResultsEvent {
  const ResultsNoteFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class ResultsSubmittedEvent extends ResultsEvent {
  const ResultsSubmittedEvent(this.result);

  final HormoneResultData result;

  @override
  List<Object?> get props => [result];
}

class ResultQuestionAddedEvent extends ResultsEvent {
  const ResultQuestionAddedEvent(this.question);

  final ResultQuestionData question;

  @override
  List<Object?> get props => [question];
}

class ResultNoteAddedEvent extends ResultsEvent {
  const ResultNoteAddedEvent(this.note);

  final ResultNoteData note;

  @override
  List<Object?> get props => [note];
}
