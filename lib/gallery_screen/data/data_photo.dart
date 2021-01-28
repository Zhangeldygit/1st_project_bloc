import 'dart:convert';

import 'package:http/http.dart';
import 'package:sample/gallery_screen/album_screen/model/photo_model.dart';

class PhotoDataSource {
  String url = 'https://jsonplaceholder.typicode.com/photos?albumId=';

  Future<List<Photo>> getPhotos(int albumId) async {
    Response response = await get(url + albumId.toString());

    return (jsonDecode(response.body) as List)
        .map((element) => Photo.fromJson(element))
        .toList();
  }
}
