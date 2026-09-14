import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/bloc/planner_bloc.dart';
import 'package:lizziedow/features/planner/bloc/planner_event.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_top_section.dart';

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlannerBloc()..add(const PlannerStartedEvent()),
      child: BlocBuilder<PlannerBloc, PlannerState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(bottom: 18.h(context)),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 28.h(context)),
              PlannerFilterChipRow(
                labels: state.topFilters,
                selectedIndex: state.selectedTopFilterIndex,
                onSelected: (index) {
                  context.read<PlannerBloc>().add(
                    PlannerTopFilterChangedEvent(index),
                  );
                },
              ),
              PlannerTopSection( 
                state: state,
                onSectionSelected: (index) {
                  context.read<PlannerBloc>().add(
                    PlannerSectionFilterChangedEvent(index),
                  );
                },
                onChecklistFilterSelected: (index) {
                  context.read<PlannerBloc>().add(
                    PlannerChecklistFilterChangedEvent(index),
                  );
                },
                onTrackerFilterSelected: (index) { 
                  context.read<PlannerBloc>().add(
                    PlannerTrackerFilterChangedEvent(index),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
