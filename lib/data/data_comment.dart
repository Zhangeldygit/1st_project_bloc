import 'dart:convert';

import 'package:sample/model/comments_model.dart';
import 'package:http/http.dart';

class CommentDataSource {
  String url = 'https://jsonplaceholder.typicode.com/comments?postId=';

  Future<List<Comment>> getComments(int postId) async {
    Response response = await get(url + postId.toString());

    return (jsonDecode(response.body) as List)
        .map((element) => Comment.fromJson(element))
        .toList();
  }
}
