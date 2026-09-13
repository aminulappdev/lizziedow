import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/dashboard/bloc/dashboard_event.dart';
import 'package:lizziedow/features/dashboard/bloc/dashboard_state.dart';
import 'package:lizziedow/features/dashboard/repository/dashboard_reposetories.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    DashboardRepository dashboardRepository = const DashboardRepository(),
  }) : _dashboardRepository = dashboardRepository,
       super(const DashboardState()) {
    on<DashboardTabChangedEvent>(_onDashboardTabChanged);
    on<DashboardStartedEvent>(_onDashboardStarted);
  }

  final DashboardRepository _dashboardRepository;

  void _onDashboardTabChanged(
    DashboardTabChangedEvent event,
    Emitter<DashboardState> emit,
  ) {
    emit(
      state.copyWith(
        currentIndex: event.index,
        navItems: _dashboardRepository.navItems,
      ),
    );
  }

  void _onDashboardStarted(
    DashboardStartedEvent event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(navItems: _dashboardRepository.navItems));
  }
}
