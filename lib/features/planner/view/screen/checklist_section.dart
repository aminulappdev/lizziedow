import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/checklist_item_bottom_sheet.dart';
import 'package:lizziedow/features/planner/view/widgets/checklist_item_tile.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';
import 'package:lizziedow/gen/assets.gen.dart';

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
    final selectedCategory = state.checklistFilters.isEmpty
        ? 'Medical'
        : state.checklistFilters[
            state.selectedChecklistFilterIndex.clamp(
              0,
              state.checklistFilters.length - 1,
            )
          ];

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedCategory,
                    style: MyFonts.dmSans.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 20.sp(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  '12 Items',
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF8F837A),
                    fontSize: 12.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
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
            child: SizedBox(
              width: double.infinity,
              height: 54.h(context),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(18.r(context)),
                      ),
                    ),
                    builder: (_) => const ChecklistItemBottomSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightThemeColors.buttonColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r(context)),
                  ),
                ),
                child: Text(
                  'Add New Checklist Item',
                  style: MyFonts.dmSans.copyWith(
                    fontSize: 13.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChecListProgress extends StatelessWidget {
  const ChecListProgress({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Row(
        children: [
          Text(
            'Completed',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 14.w(context)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r(context)),
              child: LinearProgressIndicator(
                value: 0.1,
                minHeight: 4.h(context),
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF3C3431),
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w(context)),
          Text(
            '3 Out of 30',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckListHeaderData extends StatelessWidget {
  const CheckListHeaderData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pre-Treatment',
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF9B8E84),
            fontSize: 11.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CrashSafeImage(
             Assets.images.fileNote.keyName,
             width: 24.w(context),
             height: 24.h(context),
           ),
            SizedBox(width: 6.w(context)),
            Text(
              'IVF Checklist',
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w(context)),
          child: Text(
            'A guided list of everything to consider before starting your journey, tick items off as you go, add your own and stay organised',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
