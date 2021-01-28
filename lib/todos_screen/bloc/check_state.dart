part of 'check_bloc.dart';

@immutable
abstract class CheckState {}

class CheckInitial extends CheckState {}

class CheckLoading extends CheckState {}

class CheckSuccess extends CheckState {
  final List<Todos> todos;

  CheckSuccess(this.todos);
}

class CheckFailure extends CheckState {
  final String errorCheck;

  CheckFailure(this.errorCheck);

  @override
  String toString() => errorCheck;
}
