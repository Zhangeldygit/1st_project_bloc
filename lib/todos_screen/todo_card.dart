import 'package:flutter/material.dart';

import 'model/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todos todos;
  const TodoCard({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: (todos.completed) ? (Color(0xff6C63FF)) : (null)),
      child: Row(
        children: [
          Theme(
            data: ThemeData(
                unselectedWidgetColor: Colors.white,
                selectedRowColor: Color(0xff6C63FF)),
            child: Checkbox(
              value: todos.completed,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            width: 200,
            child: Text(
              todos.title,
              style: TextStyle(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
