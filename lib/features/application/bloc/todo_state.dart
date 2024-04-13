// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {
  TodoInitial();
}

class GetTodosState extends TodoState {
  const GetTodosState();
}

class TodoDeletingState extends TodoState {
  TodoDeletingState();
}
