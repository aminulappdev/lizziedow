import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/section_header.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_medicine_tile.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_supplement_bottom_sheet.dart';

class TrackerSupplementsSection extends StatelessWidget {
  const TrackerSupplementsSection({super.key, required this.supplements});

  final List<PlannerTrackerSupplementData> supplements;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Supplements',
          trailing: Text(
            '${supplements.length} Items',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 10.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(supplements.length, (index) {
              return TrackerMedicineTile(
                title: supplements[index].title,
                detail: supplements[index].detail,
                isTakenToday: supplements[index].isTakenToday,
                showDivider: index != supplements.length - 1,
              );
            }),
          ),
        ),
        SizedBox(height: 150.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: CustomButton(
            text: 'Add New Supplement',
            onPressed: () => _showAddSupplementBottomSheet(context),
          ),
        ),
      ],
    );
  }

  void _showAddSupplementBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18.r(context)),
        ),
      ),
      builder: (_) => const TrackerSupplementBottomSheet(),
    );
  }
}
