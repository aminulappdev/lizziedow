import 'package:flutter/material.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_empty_section.dart';

class CostSection extends StatelessWidget {
  const CostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlannerEmptySection(
      title: 'Costs',
      subtitle: 'Cost records will appear here.',
    );
  }
}
