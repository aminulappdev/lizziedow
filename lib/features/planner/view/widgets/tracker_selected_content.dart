import 'package:flutter/material.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_appointments_section.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_cycle_section.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_medication_section.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_supplements_section.dart';
import 'package:lizziedow/features/planner/view/screen/tracker_symptoms_section.dart';

class TrackerSelectedContent extends StatelessWidget {
  const TrackerSelectedContent({super.key, required this.state});

  final PlannerState state;

  @override
  Widget build(BuildContext context) {
    if (state.selectedTrackerFilterIndex == 1) {
      return TrackerMedicationSection(medicines: state.trackerMedicines);
    }

    if (state.selectedTrackerFilterIndex == 3) {
      return TrackerAppointmentsSection(appointments: state.appointments);
    }

    if (state.selectedTrackerFilterIndex == 4) {
      return TrackerSymptomsSection(
        moods: state.trackerMoods,
        symptoms: state.trackerSymptoms,
      );
    }

    if (state.selectedTrackerFilterIndex == 2) {
      return const TrackerSupplementsSection();
    }

    return const TrackerCycleSection();
  }
}
