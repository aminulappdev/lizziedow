import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/section_header.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_medicine_bottom_sheet.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_medicine_tile.dart';

class TrackerMedicationSection extends StatelessWidget {
  const TrackerMedicationSection({super.key, required this.medicines});

  final List<PlannerTrackerMedicineData> medicines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader( 
          title: 'Medication',
          trailing: Text(
            '${medicines.length} Items',
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
            children: List.generate(medicines.length, (index) {
              return TrackerMedicineTile(
                title: medicines[index].title,
                detail: medicines[index].detail,
                isTakenToday: medicines[index].isTakenToday,
                showDivider: index != medicines.length - 1,
              );
            }),
          ),
        ),
        SizedBox(height: 150.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: CustomButton(
            text: 'Add New Medication',
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
                builder: (_) => const TrackerMedicineBottomSheet(),
              );
            },
          ),
        ),
      ],
    );
  }
}
