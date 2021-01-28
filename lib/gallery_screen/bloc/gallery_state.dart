part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {
  final List<dynamic> albums = const [];
}

class GalleryLoading extends GalleryState {}

class GallerySuccess extends GalleryState {
  final List<Album> albums;

  GallerySuccess(this.albums);
}

class GalleryFailure extends GalleryState {
  final String message;

  GalleryFailure(this.message);

  @override
  String toString() => message;
}
