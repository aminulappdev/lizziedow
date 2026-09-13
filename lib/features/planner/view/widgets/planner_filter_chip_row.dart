import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/widgets/home_filter_chip.dart';

class PlannerFilterChipRow extends StatelessWidget {
  const PlannerFilterChipRow({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(labels.length, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == labels.length - 1 ? 0 : 12.w(context),
                ),
                child: HomeFilterChip(
                  label: labels[index],
                  isSelected: index == selectedIndex,
                  onTap: () => onSelected(index),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
