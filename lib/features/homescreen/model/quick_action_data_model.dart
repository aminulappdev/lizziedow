class QuickActionCardDataModel {
  const QuickActionCardDataModel({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final String icon;
}

class MedicationData {
  const MedicationData({
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

class AppointmentData {
  const AppointmentData({
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
