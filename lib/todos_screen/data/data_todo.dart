import 'package:sample/todos_screen/model/todo_model.dart';
import 'dart:convert';

import 'package:http/http.dart';

class TodosDataSource {
  String url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todos>> getTodos() async {
    Response response = await get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Todos.fromJson(element))
        .toList();
  }
}
