import 'package:lizziedow/features/planner/model/planner_model.dart';

class PlannerRepository {
  const PlannerRepository();

  List<String> get topFilters => const [
    'Calendar',
    'Checklist',
    'Tracker',
    'Cost',
  ];

  List<String> get sectionFilters => const [
    'Appointments',
    'Medications',
    'Journal',
  ];

  List<String> get checklistFilters => const [
    'Medical',
    'Financial',
    'Lifestyle',
    'Wellbeing',
    'Partner',
  ];

  List<String> get trackerFilters => const [
    'Cycle',
    'Medications',
    'Supplements',
    'Appointments',
    'Symptoms',
  ];

  List<String> get trackerMoods => const [
    'Neutral',
    'Calm',
    'Anxious',
    'Grateful',
    'Neutral',
    'Sad',
    'Motivated',
    'Other',
  ];

  List<String> get trackerSymptoms => const [
    'Bloating',
    'Fatigue',
    'Headache',
    'Nausea',
    'Breast Tenderness',
    'Cramping',
    'Other',
  ];

  List<PlannerCalendarDay> get calendarDays => const [
    PlannerCalendarDay(day: 1, cycleCode: 'CD01'),
    PlannerCalendarDay(day: 2, cycleCode: 'CD02'),
    PlannerCalendarDay(day: 3, cycleCode: 'CD03'),
    PlannerCalendarDay(day: 4, cycleCode: 'CD04'),
    PlannerCalendarDay(day: 5, cycleCode: 'CD05'),
    PlannerCalendarDay(day: 6, cycleCode: 'CD06'),
    PlannerCalendarDay(day: 7, cycleCode: 'CD07'),
    PlannerCalendarDay(day: 8, cycleCode: 'CD08'),
    PlannerCalendarDay(day: 9, cycleCode: 'CD09', hasAppointment: true),
    PlannerCalendarDay(day: 10, cycleCode: 'CD10'),
    PlannerCalendarDay(day: 11, cycleCode: 'CD11'),
    PlannerCalendarDay(day: 12, cycleCode: 'CD12', hasCycleDay: true),
    PlannerCalendarDay(day: 13),
    PlannerCalendarDay(day: 14),
    PlannerCalendarDay(day: 15),
    PlannerCalendarDay(day: 16, isSelected: true),
    PlannerCalendarDay(day: 17),
    PlannerCalendarDay(day: 18),
    PlannerCalendarDay(day: 19),
    PlannerCalendarDay(day: 20),
    PlannerCalendarDay(day: 21),
    PlannerCalendarDay(day: 22),
    PlannerCalendarDay(day: 23),
    PlannerCalendarDay(day: 24),
    PlannerCalendarDay(day: 25),
    PlannerCalendarDay(day: 26),
    PlannerCalendarDay(day: 27),
    PlannerCalendarDay(day: 28),
    PlannerCalendarDay(day: 29),
    PlannerCalendarDay(day: 30),
    PlannerCalendarDay(day: 31),
  ];

  List<PlannerAppointmentData> get appointments => const [
    PlannerAppointmentData(
      doctorName: 'Dr. Sarah Chen',
      schedule: 'Aug 3, 2026  .  9:30 AM',
    ),
    PlannerAppointmentData(
      doctorName: 'Dr. Sarah Chen',
      schedule: 'Aug 3, 2026  .  9:30 AM',
    ),
    PlannerAppointmentData(
      doctorName: 'Dr. Sarah Chen',
      schedule: 'Aug 3, 2026  .  9:30 AM',
    ),
  ];

  List<PlannerMedicationData> get medications => const [
    PlannerMedicationData(
      title: 'Vitamin D3 + K2',
      detail: '2 Times left  .  Next 8:00 AM',
    ),
    PlannerMedicationData(
      title: 'Vitamin D3 + K2',
      detail: '2 Times left  .  Next 8:00 AM',
    ),
    PlannerMedicationData(
      title: 'Vitamin D3 + K2',
      detail: '2 Times left  .  Next 8:00 AM',
    ),
  ];

  List<PlannerJournalData> get journals => const [
    PlannerJournalData(
      title: "Today I've Felt pain",
      description: 'Lorem ipsum dolor sit amet consectetur.',
    ),
    PlannerJournalData(
      title: "Today I've Felt pain",
      description: 'Lorem ipsum dolor sit amet consectetur.',
    ),
    PlannerJournalData(
      title: "Today I've Felt pain",
      description: 'Lorem ipsum dolor sit amet consectetur.',
    ),
  ];

  List<PlannerChecklistData> get checklistItems => const [
    PlannerChecklistData(
      title: 'Schedule initial consultation with fertility clinic',
    ),
    
    PlannerChecklistData(
      title: 'Virology screening (both partners)',
    ),
    PlannerChecklistData(
      title: 'Saline sonogram / HSG to check uterus',
    ),
    PlannerChecklistData(
      title: 'Review and sign IVF consent forms',
    ),
  ];

  List<PlannerTrackerMedicineData> get trackerMedicines => const [
    PlannerTrackerMedicineData(
      title: 'Vitamin D3 + K2',
      detail: '225 IU  .  Injection',
    ),
    PlannerTrackerMedicineData(
      title: 'Vitamin D3 + K2',
      detail: '225 IU  .  Injection',
    ),
    PlannerTrackerMedicineData(
      title: 'Vitamin D3 + K2',
      detail: '225 IU  .  Injection',
    ),
    PlannerTrackerMedicineData(
      title: 'Vitamin D3 + K2',
      detail: '225 IU  .  Injection',
    ),
  ];
}
