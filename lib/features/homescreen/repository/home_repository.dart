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
    (_) => MedicationData(
      title: 'Vitamin D3 + K2',
      subtitle01: '2 Times left',
      subtitle02: 'Next 8:00 AM',
      iconPath: Assets.images.medichine.keyName,
    ),
  );

  List<AppointmentData> get appointments => [
    AppointmentData(
      title: 'Dr. Sarah Chen',
      subtitle01: 'Aug 3, 2026  .  9:30 AM',
      subtitle02: '',
      iconPath: Assets.images.calenderChek.keyName,
    ),
    AppointmentData(
      title: 'Dr. Marcus Rivera',
      subtitle01: 'Aug 5, 2026  .  11:00 AM',
      subtitle02: '',
      iconPath: Assets.images.calenderChek.keyName,
    ),
    AppointmentData(
      title: 'Dr. Aisha Patel',
      subtitle01: 'Aug 8, 2026  .  3:45 PM',
      subtitle02: '',
      iconPath: Assets.images.calenderChek.keyName,
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
