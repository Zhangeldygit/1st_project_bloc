part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {
  final List<dynamic> comments = const [];
}

class CommentLoading extends CommentState {}

class CommentSuccess extends CommentState {
  final List<Comment> comments;

  CommentSuccess(this.comments);
}

class CommentFailure extends CommentState {
  final String error;

  CommentFailure(this.error);

  @override
  String toString() => error;
}
