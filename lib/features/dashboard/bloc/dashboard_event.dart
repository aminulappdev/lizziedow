import 'package:equatable/equatable.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardStartedEvent extends DashboardEvent {
  const DashboardStartedEvent();

  @override
  List<Object?> get props => [];
}

class DashboardTabChangedEvent extends DashboardEvent {
  const DashboardTabChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
