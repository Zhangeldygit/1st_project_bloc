part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}

class GetPhotos extends PhotosEvent {
  final int albumId;

  GetPhotos(this.albumId);
}
