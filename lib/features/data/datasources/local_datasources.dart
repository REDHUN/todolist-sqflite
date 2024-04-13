import 'package:todoapp/features/domain/entities/todo_entity.dart';

abstract class LocalDataSource {
  Future<void> addTodo(TodoEntity todo);
  Future<void> deleteTodo(TodoEntity todo);
  Future<void> trashTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo, int index);
  Future<void> completedTodo(TodoEntity todo);
  Future<void> restoreTodo(TodoEntity todo);
}
