class PlannerCalendarDay {
  const PlannerCalendarDay({
    required this.day,
    this.cycleCode,
    this.hasAppointment = false,
    this.hasCycleDay = false,
    this.isSelected = false,
  });

  final int day;
  final String? cycleCode;
  final bool hasAppointment;
  final bool hasCycleDay;
  final bool isSelected;
}

class PlannerAppointmentData {
  const PlannerAppointmentData({
    required this.title,
    required this.subtitle01,
    required this.subtitle02,
    required this.iconPath,
  });

  final String title;
  final String subtitle01;
  final String subtitle02;
  final String iconPath;
}

class PlannerMedicationData {
  const PlannerMedicationData({
    required this.title,
    required this.subtitle01,
    required this.subtitle02,
    required this.iconPath,
  });

  final String title;
  final String subtitle01;
  final String subtitle02;
  final String iconPath;
}

class PlannerJournalData {
  const PlannerJournalData({required this.title, required this.description});

  final String title;
  final String description;
}

class PlannerChecklistData {
  const PlannerChecklistData({required this.title, this.isCompleted = false});

  final String title;
  final bool isCompleted;
}

class PlannerTrackerMedicineData {
  const PlannerTrackerMedicineData({
    required this.title,
    required this.detail,
    this.isTakenToday = false,
  });

  final String title;
  final String detail;
  final bool isTakenToday;
}
