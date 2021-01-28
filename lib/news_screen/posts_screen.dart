import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/post/post_bloc.dart';
import 'package:sample/card/post_card.dart';
// import 'package:sample/data/data_posts.dart';
import 'package:sample/gradient_appbar.dart';
// import 'package:sample/model/post_model.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc()..add(LoadPosts()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(
              title: "News",
              isHided: true,
            ),
            PostsList(),
          ],
        ),
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostFailure) {
            return Text(state.errorMessage);
          }
          if (state is PostSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: state.posts[index]);
              },
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}
