class Comment {
  final int id;
  final String name;
  final String body;

  Comment({this.id, this.name, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as int,
      name: json['name'] as String,
      body: json['body'] as String,
      // postId: json['postId'] as int,
    );
  }
}
