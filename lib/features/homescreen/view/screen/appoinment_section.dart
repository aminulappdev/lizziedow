import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/model/quick_action_data_model.dart';
import 'package:lizziedow/features/homescreen/view/widgets/appointment_tile.dart';
import 'package:lizziedow/features/homescreen/view/widgets/section_header.dart';

class AppointmentsContent extends StatelessWidget {
  const AppointmentsContent({super.key, required this.appointments});

  final List<AppointmentData> appointments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Today's Appointments",
          trailing: Text(
            '${appointments.length.toString().padLeft(2, '0')} Total',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 8.h(context)),
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
      ],
    );
  }
}