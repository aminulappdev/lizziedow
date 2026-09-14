import 'package:flutter/material.dart';
import 'package:lizziedow/features/homescreen/view/screen/symptom_log_section.dart';

class TrackerSymptomsSection extends StatelessWidget {
  const TrackerSymptomsSection({
    super.key,
    required this.moods,
    required this.symptoms,
  });

  final List<String> moods;
  final List<String> symptoms;

  @override
  Widget build(BuildContext context) {
    return SymptomLogPanel(
      moods: moods,
      symptoms: symptoms,
      buttonText: 'Save Changes',
    );
  }
}
