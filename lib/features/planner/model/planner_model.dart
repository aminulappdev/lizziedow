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
    required this.doctorName,
    required this.schedule,
  });

  final String doctorName;
  final String schedule;
}

class PlannerMedicationData {
  const PlannerMedicationData({
    required this.title,
    required this.detail,
  });

  final String title;
  final String detail;
}

class PlannerJournalData {
  const PlannerJournalData({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class PlannerChecklistData {
  const PlannerChecklistData({
    required this.title,
    this.isCompleted = false,
  });

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
