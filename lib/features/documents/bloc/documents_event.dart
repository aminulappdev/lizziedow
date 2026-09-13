import 'package:equatable/equatable.dart';
import 'package:lizziedow/features/documents/model/documents_model.dart';

sealed class DocumentsEvent extends Equatable {
  const DocumentsEvent();

  @override
  List<Object?> get props => [];
}

class DocumentsStartedEvent extends DocumentsEvent {
  const DocumentsStartedEvent();
}

class DocumentsTopFilterChangedEvent extends DocumentsEvent {
  const DocumentsTopFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class DocumentsPhotoFilterChangedEvent extends DocumentsEvent {
  const DocumentsPhotoFilterChangedEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

class DocumentUploadedEvent extends DocumentsEvent {
  const DocumentUploadedEvent(this.document);

  final DocumentFileData document;

  @override
  List<Object?> get props => [document];
}

class DocumentPhotoAddedEvent extends DocumentsEvent {
  const DocumentPhotoAddedEvent(this.photo);

  final DocumentPhotoData photo;

  @override
  List<Object?> get props => [photo];
}
