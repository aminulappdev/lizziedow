import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_tile.dart';
import 'package:lizziedow/core/widgets/section_header.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/features/planner/view/widgets/journal_tile.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_appointment_bottom_sheet.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_journal_bottom_sheet.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_medicine_bottom_sheet.dart';

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
          onTap: () => _showAddAppointmentBottomSheet(context),
        ),
        SizedBox(height: 8.h(context)),
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
      ],
    );
  }

  void _showAddAppointmentBottomSheet(BuildContext context) {
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
      builder: (_) => const PlannerAppointmentBottomSheet(),
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
          onTap: () => _showAddMedicineBottomSheet(context),
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(medications.length, (index) {
              return CustomTile(
                title: medications[index].title,
                subtitle01: medications[index].subtitle01,
                subtitle02: medications[index].subtitle02,
                showDivider: index != medications.length - 1,
                iconPath: medications[index].iconPath,
              );
            }),
          ),
        ),
      ],
    );
  }

  void _showAddMedicineBottomSheet(BuildContext context) {
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
      builder: (_) => const TrackerMedicineBottomSheet(),
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
          onTap: () => _showAddJournalBottomSheet(context),
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

  void _showAddJournalBottomSheet(BuildContext context) {
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
      builder: (_) => const PlannerJournalBottomSheet(),
    );
  }
}
