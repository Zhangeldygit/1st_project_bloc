part of 'photos_bloc.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {
  final List<Photo> photos = const [];
}

class PhotosLoading extends PhotosState {}

class PhotosSuccess extends PhotosState {
  final List<Photo> photos;

  PhotosSuccess(this.photos);
}

class PhotosFailure extends PhotosState {
  final String messageError;

  PhotosFailure(this.messageError);

  @override
  String toString() => messageError;
}
