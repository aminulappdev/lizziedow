import 'package:lizziedow/features/homescreen/model/quick_action_data_model.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class HomeRepository {
  const HomeRepository();

  List<String> get filters => const [
    'Log symptoms',
    'Medications',
    'Appointments',
  ];
  
  List<QuickActionCardDataModel> get quickCards => [
    QuickActionCardDataModel(
      title: 'Symptoms tracker',
      description: 'Log symptoms and notes for your cycle',
      icon: Assets.images.heart02.keyName,
    ),
    QuickActionCardDataModel(
      title: 'Cycle tracker',
      description:
          'Log medications, appointments, symptoms and full cycle at a glance',
      icon: Assets.images.calenderChek.keyName,
    ),
    QuickActionCardDataModel(
      title: 'Appointments',
      description: 'Log medications, appointments and notes',
      icon: Assets.images.calenderLove.keyName,
    ),
  ];

  List<MedicationData> get medications => List.generate(
    3,
    (_) => const MedicationData(
      title: 'Vitamin D3 + K2',
      detail: '2 Times left  .  Next 8:00 AM',
    ),
  );

  List<AppointmentData> get appointments => const [
    AppointmentData(
      doctorName: 'Dr. Sarah Chen',
      schedule: 'Aug 3, 2026  .  9:30 AM',
    ),
    AppointmentData(
      doctorName: 'Dr. Marcus Rivera',
      schedule: 'Aug 5, 2026  .  11:00 AM',
    ),
    AppointmentData(
      doctorName: 'Dr. Aisha Patel',
      schedule: 'Aug 8, 2026  .  3:45 PM',
    ),
  ];

  List<String> get moods => const [
    'Neutral',
    'Calm',
    'Anxious',
    'Grateful',
    'Neutral',
    'Sad',
    'Motivated',
    'Other',
  ];

  List<String> get symptoms => const [
    'Bloating',
    'Fatigue',
    'Headache',
    'Nausea',
    'Breast Tenderness',
    'Cramping',
    'Other',
  ];
}
