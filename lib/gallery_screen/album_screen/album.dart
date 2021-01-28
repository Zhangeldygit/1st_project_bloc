import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/gallery_screen/bloc/gallery_bloc.dart';
import 'package:sample/gallery_screen/photos_screen/photos.dart';
import 'package:sample/gradient_appbar.dart';

import 'model/album_model.dart';
import 'model/photo_model.dart';

class AlbumsScreen extends StatelessWidget {
  final Album album;
  final Photo photo;
  const AlbumsScreen({Key key, this.album, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GalleryBloc()..add(GetGallery()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(
              title: 'Gallery',
              isHided: true,
            ),
            AlbumList(),
          ],
        ),
      ),
    );
  }
}

class AlbumList extends StatelessWidget {
  const AlbumList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GalleryBloc, GalleryState>(
        builder: (context, state) {
          if (state is GalleryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GalleryFailure) {
            return Text(state.message);
          }
          if (state is GallerySuccess) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotosScreen(
                                album: state.albums[index],
                                photo: state.albums[index].images,
                              )),
                    );
                  },
                  child: Container(
                    child: Stack(
                      children: [
                        Image.network(
                          state.albums[index].images.first.thumbnailUrl,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(state.albums[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), maxLines: 1,),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}
