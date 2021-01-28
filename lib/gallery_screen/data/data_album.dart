import 'dart:convert';

import 'package:http/http.dart';
import 'package:sample/gallery_screen/album_screen/model/album_model.dart';
// import 'package:sample/gallery_screen/album_screen/model/album_model.dart';

class AlbumDataSource {
  String url = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> getAlbums() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Album.fromJson(element))
        .toList();
  }
}
