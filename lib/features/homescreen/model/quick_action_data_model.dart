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
  const MedicationData({required this.title, required this.detail});

  final String title;
  final String detail;
}

class AppointmentData {
  const AppointmentData({
    required this.doctorName,
    required this.schedule,
  });

  final String doctorName;
  final String schedule;
}
