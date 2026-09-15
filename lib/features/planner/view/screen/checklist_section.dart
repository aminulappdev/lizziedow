import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/section_header.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/check_list_header.dart';
import 'package:lizziedow/features/planner/view/widgets/checklist_item_bottom_sheet.dart';
import 'package:lizziedow/features/planner/view/widgets/checklist_item_tile.dart';
import 'package:lizziedow/features/planner/view/widgets/checklist_progress.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';

class ChecklistSection extends StatelessWidget {
  const ChecklistSection({
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
          CheckListHeaderData(),
          SizedBox(height: 22.h(context)),
          ChecListProgress(),
          SizedBox(height: 22.h(context)),
          PlannerFilterChipRow(
            labels: state.checklistFilters,
            selectedIndex: state.selectedChecklistFilterIndex,
            onSelected: onFilterSelected,
          ),
          SizedBox(height: 26.h(context)),
          SectionHeader(
            title: 'Medical',
            trailing: Text(
              '12 Items',
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: 12.h(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
            child: Column(
              children: List.generate(state.checklistItems.length, (index) {
                final item = state.checklistItems[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h(context)),
                  child: ChecklistItemTile(
                    title: item.title,
                    isCompleted: item.isCompleted,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 8.h(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
            child: CustomButton(
              text: 'Add Item',
              borderRadius: 12.r(context),
              onPressed: () => _showAddItemBottomSheet(context),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddItemBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r(context)),
        ),
      ),
      builder: (_) => const ChecklistItemBottomSheet(),
    );
  }
}
