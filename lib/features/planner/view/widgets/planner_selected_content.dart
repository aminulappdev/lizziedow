import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/widgets/appointment_tile.dart';
import 'package:lizziedow/features/homescreen/view/widgets/medication_tile.dart';
import 'package:lizziedow/features/homescreen/view/widgets/section_header.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/features/planner/view/widgets/journal_tile.dart';

class PlannerSelectedContent extends StatelessWidget {
  const PlannerSelectedContent({super.key, required this.state});

  final PlannerState state;

  @override
  Widget build(BuildContext context) {
    if (state.selectedSectionFilterIndex == 1) {
      return _PlannerMedicationsContent(medications: state.medications);
    }

    if (state.selectedSectionFilterIndex == 2) {
      return _PlannerJournalsContent(journals: state.journals);
    }

    return _PlannerAppointmentsContent(appointments: state.appointments);
  }
}

class _PlannerAppointmentsContent extends StatelessWidget {
  const _PlannerAppointmentsContent({required this.appointments});

  final List<PlannerAppointmentData> appointments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'All Appointments',
          trailing: Text(
            '+ Add Appointment',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: () {},
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

class _PlannerMedicationsContent extends StatelessWidget {
  const _PlannerMedicationsContent({required this.medications});

  final List<PlannerMedicationData> medications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'All Medicines',
          trailing: Text(
            '+ Add Medicine',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(medications.length, (index) {
              return MedicationTile(
                title: medications[index].title,
                detail: medications[index].detail,
                showDivider: index != medications.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _PlannerJournalsContent extends StatelessWidget {
  const _PlannerJournalsContent({required this.journals});

  final List<PlannerJournalData> journals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'All Journals',
          trailing: Text(
            '+ Add New',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(journals.length, (index) {
              return JournalTile(
                title: journals[index].title,
                description: journals[index].description,
                showDivider: index != journals.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}
