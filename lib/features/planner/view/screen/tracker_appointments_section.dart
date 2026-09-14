import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_tile.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';

class TrackerAppointmentsSection extends StatelessWidget {
  const TrackerAppointmentsSection({super.key, required this.appointments});

  final List<PlannerAppointmentData> appointments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Today's Appointments",
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 16.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                '${appointments.length.toString().padLeft(2, '0')} Total',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 12.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(appointments.length, (index) {
              return CustomTile(
                title: appointments[index].title,
                subtitle01: appointments[index].subtitle01,
                subtitle02: appointments[index].subtitle02,
                showDivider: index != appointments.length - 1,
                iconPath: appointments[index].iconPath,
                trailingWidget: Icon(Icons.more_vert, size: 20.sp(context)),
              );
            }),
          ),
        ),
        SizedBox(height: 244.h(context)),
        CustomButton(text: 'Add Appointment', onPressed: () {}),
      ],
    );
  }
}
