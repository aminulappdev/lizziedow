import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/features/documents/bloc/documents_event.dart';
import 'package:lizziedow/features/documents/bloc/documents_state.dart';
import 'package:lizziedow/features/documents/repository/documents_repository.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  DocumentsBloc({
    DocumentsRepository documentsRepository = const DocumentsRepository(),
  }) : _documentsRepository = documentsRepository,
       super(const DocumentsState()) {
    on<DocumentsStartedEvent>(_onDocumentsStarted);
    on<DocumentsTopFilterChangedEvent>(_onDocumentsTopFilterChanged);
    on<DocumentsPhotoFilterChangedEvent>(_onDocumentsPhotoFilterChanged);
    on<DocumentUploadedEvent>(_onDocumentUploaded);
    on<DocumentPhotoAddedEvent>(_onDocumentPhotoAdded);
  }

  final DocumentsRepository _documentsRepository;

  void _onDocumentsStarted(
    DocumentsStartedEvent event,
    Emitter<DocumentsState> emit,
  ) {
    emit(
      state.copyWith(
        topFilters: _documentsRepository.topFilters,
        photoFilters: _documentsRepository.photoFilters,
        totalDocumentCount: _documentsRepository.totalDocumentCount,
        totalPhotoCount: _documentsRepository.totalPhotoCount,
        documents: _documentsRepository.documents,
        photos: _documentsRepository.photos,
      ),
    );
  }

  void _onDocumentsTopFilterChanged(
    DocumentsTopFilterChangedEvent event,
    Emitter<DocumentsState> emit,
  ) {
    emit(state.copyWith(selectedTopFilterIndex: event.index));
  }

  void _onDocumentsPhotoFilterChanged(
    DocumentsPhotoFilterChangedEvent event,
    Emitter<DocumentsState> emit,
  ) {
    emit(state.copyWith(selectedPhotoFilterIndex: event.index));
  }

  void _onDocumentUploaded(
    DocumentUploadedEvent event,
    Emitter<DocumentsState> emit,
  ) {
    emit(state.copyWith(documents: [event.document, ...state.documents]));
  }

  void _onDocumentPhotoAdded(
    DocumentPhotoAddedEvent event,
    Emitter<DocumentsState> emit,
  ) {
    emit(state.copyWith(photos: [event.photo, ...state.photos]));
  }
}
