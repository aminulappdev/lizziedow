import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/widgets/appointment_tile.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_shared_widgets.dart';

class TrackerAppointmentsSection extends StatelessWidget {
  const TrackerAppointmentsSection({
    super.key,
    required this.appointments,
  });

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
              return AppointmentTile(
                doctorName: appointments[index].doctorName,
                schedule: appointments[index].schedule,
                showDivider: index != appointments.length - 1,
              );
            }),
          ),
        ),
        SizedBox(height: 244.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: TrackerPrimaryButton(
            label: 'Add New Medication',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
