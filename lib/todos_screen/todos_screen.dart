import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/gradient_appbar.dart';
import 'package:sample/todos_screen/bloc/check_bloc.dart';
import 'package:sample/todos_screen/todo_card.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckBloc()..add(GetTodos()),
      child: Scaffold(
        backgroundColor: Color(0xff0F0B21),
        body: Column(
          children: [
            GradientAppBar(isHided: true, title: 'Todos'),
            TodosList(),
          ],
        ),
      ),
    );
  }
}

class TodosList extends StatelessWidget {
  const TodosList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CheckBloc, CheckState>(
        builder: (context, state) {
          if (state is CheckLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckFailure) {
            return Text(state.errorCheck);
          }
          if (state is CheckSuccess) {
            return ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  todos: state.todos[index],
                );
              },
            );
          } else
            return Offstage();
        },
      ),
    );
  }
}
