import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample/gallery_screen/album_screen/model/photo_model.dart';
import 'package:sample/gallery_screen/data/data_photo.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotoDataSource _photoDataSource = PhotoDataSource();
  PhotosBloc() : super(PhotosInitial());

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if (event is GetPhotos) {
      yield PhotosLoading();
      try {
        final List<Photo> photos =
            await _photoDataSource.getPhotos(event.albumId);
        yield PhotosSuccess(photos);
      } on Exception catch (e) {
        yield PhotosFailure(e.toString());
      }
    }
  }
}
