import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';
import 'package:lizziedow/features/planner/view/widgets/track_process_indicator.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_selected_content.dart';

class TrackerSection extends StatelessWidget {
  const TrackerSection({
    super.key,
    required this.state,
    required this.onFilterSelected,
  });

  final PlannerState state;
  final ValueChanged<int> onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28.h(context)),
      child: Column(
        children: [
          const TrackerProgress(),
          SizedBox(height: 26.h(context)),
          PlannerFilterChipRow(
            labels: state.trackerFilters,
            selectedIndex: state.selectedTrackerFilterIndex,
            onSelected: onFilterSelected,
          ),
          SizedBox(height: 28.h(context)),
          TrackerSelectedContent(state: state),
        ],
      ),
    );
  }
}
