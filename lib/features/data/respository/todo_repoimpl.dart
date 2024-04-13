import 'package:todoapp/features/data/datasources/local_datasources.dart';
import 'package:todoapp/features/data/datasources/local_datasourcesimpl.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/respository/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  LocalDataSource localDataSource = LocalDataSourcesImpl();
  @override
  Future<void> addTodo(TodoEntity todo) {
    return localDataSource.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(TodoEntity todo) {
    return localDataSource.deleteTodo(todo);
  }

  @override
  Future<void> updateTodo(TodoEntity todo, int index) {
    return localDataSource.updateTodo(todo, index);
  }

  @override
  Future<void> completedTodo(TodoEntity todo) {
    return localDataSource.completedTodo(todo);
  }

  @override
  Future<void> restoreTodo(TodoEntity todo, int index) async {
    return localDataSource.restoreTodo(todo);
  }

  @override
  Future<void> trashTodo(TodoEntity todo) {
    return localDataSource.trashTodo(todo);
  }
}
