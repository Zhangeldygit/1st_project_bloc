class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todos({this.userId, this.id, this.title, this.completed});

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
