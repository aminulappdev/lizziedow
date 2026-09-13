import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_calendar_card.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_selected_content.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({
    super.key,
    required this.state,
    required this.onSectionSelected,
  });

  final PlannerState state;
  final ValueChanged<int> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 42.h(context)),
        PlannerCalendarCard(days: state.calendarDays),
        SizedBox(height: 32.h(context)),
        PlannerFilterChipRow(
          labels: state.sectionFilters,
          selectedIndex: state.selectedSectionFilterIndex,
          onSelected: onSectionSelected,
        ),
        SizedBox(height: 30.h(context)),
        PlannerSelectedContent(state: state),
      ],
    );
  }
}
