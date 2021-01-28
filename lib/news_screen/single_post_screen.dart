import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:sample/data/data_comment.dart';

// import 'package:sample/gradient_appbar.dart';
import 'package:sample/bloc/comment/comment_bloc.dart';
import 'package:sample/card/comment_card.dart';
// import 'package:sample/comments_screen.dart';

import 'package:sample/gradient_appbar.dart';
import 'package:sample/model/post_model.dart';
import 'package:sample/news_screen/comments_screen.dart';

class PostScreen extends StatelessWidget {
  final Post post;
  const PostScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentBloc()..add(GetCommentsEvent(post.id)),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(title: post.title),
            Container(
              child: ListTile(
                  title: Text(
                    post.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),

                  subtitle: Text(
                    post.body,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if (state is CommentLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CommentFailure) {
                    return Text(state.error);
                  } else if (state is CommentSuccess) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 10, bottom: 20),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return CommentCard(
                                comment: state.comments[index],
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Color(0xff6C63FF),
                            height: 50,
                            width: double.maxFinite,
                            child: FlatButton(
                              height: MediaQuery.of(context).size.height,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CommentsScreen(post: post),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Show me' +
                                        ' ' +
                                        state.comments.last.id.toString() +
                                        ' results',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else
                    return Offstage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
