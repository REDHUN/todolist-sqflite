part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final TodoEntity todo;

  const AddTodo({required this.todo});

  @override
  List<Object> get props => [todo];
}

class GetTodo extends TodoEvent {
  final List<TodoEntity> todolist;

  const GetTodo({required this.todolist});

  @override
  List<Object> get props => [todolist];
}

class UpdateTodo extends TodoEvent {
  final TodoEntity todo;
  final int index;

  const UpdateTodo({required this.todo, required this.index});

  @override
  List<Object> get props => [todo];
}

class DeleteTodo extends TodoEvent {
  final TodoEntity todo;

  const DeleteTodo({required this.todo});
}

class TrashTodo extends TodoEvent {
  final TodoEntity todo;

  const TrashTodo({required this.todo});
}

class CompletedTodo extends TodoEvent {
  final TodoEntity todo;

  const CompletedTodo({required this.todo});
}

class RestoreTodo extends TodoEvent {
  final TodoEntity todo;
  final int index;
  const RestoreTodo({required this.todo, required this.index});
}
