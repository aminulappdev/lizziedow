import 'package:equatable/equatable.dart';

sealed class PlannerEvent extends Equatable {
  const PlannerEvent();

  @override
  List<Object?> get props => [];
}

class PlannerStartedEvent extends PlannerEvent {
  const PlannerStartedEvent();
}

class PlannerTopFilterChangedEvent extends PlannerEvent {
  const PlannerTopFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class PlannerSectionFilterChangedEvent extends PlannerEvent {
  const PlannerSectionFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class PlannerChecklistFilterChangedEvent extends PlannerEvent {
  const PlannerChecklistFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class PlannerTrackerFilterChangedEvent extends PlannerEvent {
  const PlannerTrackerFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class PlannerCostAlreadyPaidChangedEvent extends PlannerEvent {
  const PlannerCostAlreadyPaidChangedEvent(this.isAlreadyPaid);

  final bool isAlreadyPaid;

  @override
  List<Object?> get props => [isAlreadyPaid];
}
