import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeStartedEvent extends HomeEvent {
  const HomeStartedEvent();
}

class HomeFilterChangedEvent extends HomeEvent {
  const HomeFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
