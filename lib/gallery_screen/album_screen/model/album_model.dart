import 'package:sample/gallery_screen/album_screen/model/photo_model.dart';

class Album {
  final int userId;
  final int id;
  final String title;
  List<Photo> images;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'] as int,
      title: json['title'] as String,
      userId: json['userId'] as int,
    );
  }
}
