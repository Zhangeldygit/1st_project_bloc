import 'dart:async';
// import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

// import 'dart:convert';

import 'package:sample/data/data_posts.dart';
import 'package:sample/model/post_model.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial());
  PostsDataSource _postsDataSource = PostsDataSource();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is LoadPosts) {
      try {
        List<Post> posts = await _postsDataSource.getPosts();
        yield PostSuccess(posts);
      } on Exception catch (e) {
        yield PostFailure(e.toString());
      }
    }
  }
}
