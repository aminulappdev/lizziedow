import 'package:flutter/material.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/screen/calendar_section.dart';
import 'package:lizziedow/features/planner/view/screen/checklist_section.dart';
import 'package:lizziedow/features/planner/view/screen/cost_section.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_section.dart';

class PlannerTopSection extends StatelessWidget {
  const PlannerTopSection({
    super.key,
    required this.state,
    required this.onSectionSelected,
    required this.onChecklistFilterSelected,
    required this.onTrackerFilterSelected,
  });

  final PlannerState state;
  final ValueChanged<int> onSectionSelected;
  final ValueChanged<int> onChecklistFilterSelected;
  final ValueChanged<int> onTrackerFilterSelected;

  @override
  Widget build(BuildContext context) {
    if (state.selectedTopFilterIndex == 1) {
      return ChecklistSection(
        state: state,
        onFilterSelected: onChecklistFilterSelected,
      );
    }

    if (state.selectedTopFilterIndex == 2) {
      return TrackerSection(
        state: state,
        onFilterSelected: onTrackerFilterSelected,
      );
    }

    if (state.selectedTopFilterIndex == 3) {
      return const CostSection();
    }

    return CalendarSection(
      state: state,
      onSectionSelected: onSectionSelected,
    );
  }
}
