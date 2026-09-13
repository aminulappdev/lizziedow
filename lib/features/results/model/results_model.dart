class ResultReportData {
  const ResultReportData({
    required this.fileName,
    required this.fileSize,
    required this.status,
  });

  final String fileName;
  final String fileSize;
  final String status;
}

class HormoneResultData {
  const HormoneResultData({
    required this.testName,
    required this.date,
    required this.value,
    required this.unit,
    this.notes = '',
  });

  final String testName;
  final String date;
  final String value;
  final String unit;
  final String notes;
}

class ResultNoteData {
  const ResultNoteData({
    required this.title,
    required this.date,
    required this.tags,
  });

  final String title;
  final String date;
  final String tags;
}

class ResultQuestionData {
  const ResultQuestionData({
    required this.title,
    required this.date,
    this.isResolved = false,
  });

  final String title;
  final String date;
  final bool isResolved;
}
