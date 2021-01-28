import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/comment/comment_bloc.dart';
import 'package:sample/card/comment_card.dart';

import 'package:sample/model/post_model.dart';
// import 'package:sample/single_post_screen.dart';
import '../gradient_appbar.dart';
// import 'package:sample/data/data_comment.dart';
// import 'gradient_appbar.dart';

// import 'package:sample/model/post_model.dart';

class CommentsScreen extends StatelessWidget {
  final String title;
  final Post post;
  const CommentsScreen({Key key, this.title, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommentBloc()..add(GetCommentsEvent(post.id)),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(
              title: post.title,
            ),
            CommentsList(),
          ],
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CommentFailure) {
            return Text(state.error);
          }
          if (state is CommentSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                return CommentCard(comment: state.comments[index]);
              },
            );
          } else {
            return Offstage();
          }
        },
      ),
    );
  }
}
