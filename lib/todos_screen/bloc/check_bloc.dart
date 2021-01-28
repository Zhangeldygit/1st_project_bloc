import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample/todos_screen/data/data_todo.dart';
import 'package:sample/todos_screen/model/todo_model.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  TodosDataSource _todosDataSource = TodosDataSource();
  CheckBloc() : super(CheckInitial());

  @override
  Stream<CheckState> mapEventToState(
    CheckEvent event,
  ) async* {
    if (event is GetTodos) {
      yield CheckLoading();
      try {
        final List<Todos> todos = await _todosDataSource.getTodos();
        yield CheckSuccess(todos);
      } on Exception catch (e) {
        yield CheckFailure(e.toString());
      }
    }
  }
}
