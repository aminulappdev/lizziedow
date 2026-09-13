class DocumentFileData {
  const DocumentFileData({
    required this.fileName,
    required this.date,
    required this.fileSize,
  });

  final String fileName;
  final String date;
  final String fileSize;
}

class DocumentUploadData {
  const DocumentUploadData({
    required this.date,
    required this.notes,
  });

  final String date;
  final String notes;
}

class DocumentPhotoData {
  const DocumentPhotoData({
    required this.fileName,
    required this.fileSize,
    required this.status,
    this.caption = '',
    this.milestone = '',
  });

  final String fileName;
  final String fileSize;
  final String status;
  final String caption;
  final String milestone;
}
