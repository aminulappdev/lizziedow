import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/documents/model/documents_model.dart';

class DocumentsState extends Equatable {
  const DocumentsState({
    this.selectedTopFilterIndex = 0,
    this.selectedPhotoFilterIndex = 0,
    this.totalDocumentCount = 0,
    this.totalPhotoCount = 0,
    this.topFilters = const [],
    this.photoFilters = const [],
    this.documents = const [],
    this.photos = const [],
  });

  final int selectedTopFilterIndex;
  final int selectedPhotoFilterIndex;
  final int totalDocumentCount;
  final int totalPhotoCount;
  final List<String> topFilters;
  final List<String> photoFilters;
  final List<DocumentFileData> documents;
  final List<DocumentPhotoData> photos;

  DocumentsState copyWith({
    int? selectedTopFilterIndex,
    int? selectedPhotoFilterIndex,
    int? totalDocumentCount,
    int? totalPhotoCount,
    List<String>? topFilters,
    List<String>? photoFilters,
    List<DocumentFileData>? documents,
    List<DocumentPhotoData>? photos,
  }) {
    return DocumentsState(
      selectedTopFilterIndex:
          selectedTopFilterIndex ?? this.selectedTopFilterIndex,
      selectedPhotoFilterIndex:
          selectedPhotoFilterIndex ?? this.selectedPhotoFilterIndex,
      totalDocumentCount: totalDocumentCount ?? this.totalDocumentCount,
      totalPhotoCount: totalPhotoCount ?? this.totalPhotoCount,
      topFilters: topFilters ?? this.topFilters,
      photoFilters: photoFilters ?? this.photoFilters,
      documents: documents ?? this.documents,
      photos: photos ?? this.photos,
    );
  }

  @override
  List<Object?> get props => [
    selectedTopFilterIndex,
    selectedPhotoFilterIndex,
    totalDocumentCount,
    totalPhotoCount,
    topFilters,
    photoFilters,
    documents,
    photos,
  ];
}
