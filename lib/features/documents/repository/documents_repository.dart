import 'package:lizziedow/features/documents/model/documents_model.dart';

class DocumentsRepository {
  const DocumentsRepository();

  List<String> get topFilters => const ['Documents', 'Photos'];

  List<String> get photoFilters => const [
    'All',
    'Stims',
    'Trigger',
    'Egg Retrieval',
  ];

  int get totalDocumentCount => 22;

  int get totalPhotoCount => 22;

  List<DocumentFileData> get documents => const [
    DocumentFileData(
      fileName: 'Doc name_T3.pdf',
      date: '27 July 2026',
      fileSize: '2.5 MB',
    ),
    DocumentFileData(
      fileName: 'Doc name_T3.pdf',
      date: '27 July 2026',
      fileSize: '2.5 MB',
    ),
    DocumentFileData(
      fileName: 'Doc name_T3.pdf',
      date: '27 July 2026',
      fileSize: '2.5 MB',
    ),
    DocumentFileData(
      fileName: 'Doc name_T3.pdf',
      date: '27 July 2026',
      fileSize: '2.5 MB',
    ),
    DocumentFileData(
      fileName: 'Doc name_T3.pdf',
      date: '27 July 2026',
      fileSize: '2.5 MB',
    ),
  ];

  List<DocumentPhotoData> get photos => const [
    DocumentPhotoData(
      fileName: 'Img name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    DocumentPhotoData(
      fileName: 'Img name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    DocumentPhotoData(
      fileName: 'Img name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
    DocumentPhotoData(
      fileName: 'Img name_T3.pdf',
      fileSize: '23.5MB',
      status: 'Uploaded Successfully',
    ),
  ];
}
