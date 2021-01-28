import 'package:flutter/material.dart';
import 'package:sample/model/post_model.dart';
import 'package:sample/news_screen/single_post_screen.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 10),
      decoration: BoxDecoration(color: Color(0xff221C44)),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PostScreen(
                      post: post,
                    )),
          );
        },
        contentPadding: EdgeInsets.all(16),
        title: Text(
          post.title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          post.body,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
