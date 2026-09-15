import 'package:lizziedow/features/planner/model/planner_model.dart';
import 'package:lizziedow/gen/assets.gen.dart';

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

  List<PlannerAppointmentData> get appointments => [
    PlannerAppointmentData(
      title: 'Dr. Sarah Chen',
      subtitle01: 'Aug 04, 2026',
      subtitle02: '9:30 AM',
      iconPath: Assets.images.calenderChek.keyName,
    ),
    PlannerAppointmentData(
      title: 'Dr. Alex Chen',
      subtitle01: 'Aug 05, 2026',
      subtitle02: '10:00 AM',
      iconPath: Assets.images.calenderChek.keyName,
    ),
    PlannerAppointmentData(
      title: 'Dr. John Smith',
      subtitle01: 'Aug 08, 2026',
      subtitle02: '2:00 PM',
      iconPath: Assets.images.calenderChek.keyName,
    ),
  ];

  List<PlannerMedicationData> get medications => [
    PlannerMedicationData(
      title: 'Vitamin B12 + K2',
      subtitle01: '3 Times left',
      subtitle02: 'Next 10:00 AM',
      iconPath: Assets.images.medichine.keyName,
    ),
    PlannerMedicationData(
      title: 'Vitamin E5 + K2',
      subtitle01: '1 Times left',
      subtitle02: 'Next 9:00 AM',
      iconPath: Assets.images.medichine.keyName,
    ),
    PlannerMedicationData(
      title: 'Vitamin D3 + K2',
      subtitle01: '2 Times left',
      subtitle02: 'Next 8:00 AM',
      iconPath: Assets.images.medichine.keyName,
    ),
  ];

  List<PlannerJournalData> get journals => const [
    PlannerJournalData(
      title: "Today I've Felt pain",
      description: 'Lorem ipsum dolor sit amet consectetur.',
    ),
    PlannerJournalData(
      title: "Tomorrow I've Felt discomfort",
      description: 'Mauris non tempor quam, et lacinia sapien.',
    ),
    PlannerJournalData(
      title: "Yesterday I've Felt happy",
      description: 'Pellentesque habitant morbi tristique senectus et netus.',
    ),
  ];

  List<PlannerChecklistData> get checklistItems => const [
    PlannerChecklistData(
      title: 'Schedule initial consultation with fertility clinic',
    ),

    PlannerChecklistData(title: 'Virology screening (both partners)'),
    PlannerChecklistData(title: 'Saline sonogram / HSG to check uterus'),
    PlannerChecklistData(title: 'Review and sign IVF consent forms'),
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

  List<PlannerTrackerSupplementData> get trackerSupplements => const [
    PlannerTrackerSupplementData(
      title: 'Omega 3',
      detail: '1000 mg  .  Capsule',
    ),
    PlannerTrackerSupplementData(
      title: 'CoQ10',
      detail: '200 mg  .  Capsule',
      isTakenToday: true,
    ),
    PlannerTrackerSupplementData(
      title: 'Folic Acid',
      detail: '400 mcg  .  Tablet',
    ),
    PlannerTrackerSupplementData(
      title: 'Prenatal Vitamin',
      detail: '1 Tablet  .  Daily',
    ),
  ];
}
