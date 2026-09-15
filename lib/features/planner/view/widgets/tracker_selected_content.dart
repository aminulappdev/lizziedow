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
    switch (state.selectedTrackerFilterIndex) { 
      case 0:
        return const TrackerCycleSection();
      case 1:
        return TrackerMedicationSection(medicines: state.trackerMedicines);
      case 2:
        return TrackerSupplementsSection(supplements: state.trackerSupplements);
      case 3:
        return TrackerAppointmentsSection(appointments: state.appointments);
      case 4:
        return TrackerSymptomsSection(
          moods: state.trackerMoods,
          symptoms: state.trackerSymptoms,
        );
      default:
        return const TrackerCycleSection();
    }
  }
}
