import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample/gallery_screen/album_screen/model/album_model.dart';
import 'package:sample/gallery_screen/album_screen/model/photo_model.dart';
// import 'package:sample/gallery_screen/album_screen/model/album_model.dart';
import 'package:sample/gallery_screen/data/data_album.dart';
import 'package:sample/gallery_screen/data/data_photo.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitial());
  AlbumDataSource _albumDataSource = AlbumDataSource();
  PhotoDataSource _photoDataSource = PhotoDataSource();

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    if (event is GetGallery) {
      yield GalleryLoading();
      try {
        final List<Album> albums = await _albumDataSource.getAlbums();
        for (final Album album in albums) {
          final List<Photo> photos = await _photoDataSource.getPhotos(album.id);

          album.images = photos;
        }
        yield GallerySuccess(albums);
      } on Exception catch (e) {
        yield GalleryFailure(e.toString());
      }
    }
  }
}
