import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/data/datasources/local_datasources.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class LocalDataSourcesImpl implements LocalDataSource {
  @override
  Future<void> addTodo(TodoEntity todo) async {
    final TodoEntity todoEntity = TodoEntity(
        title: todo.title,
        isdeleted: todo.isdeleted,
        isdone: todo.isdone,
        description: todo.description,
        todoid: todo.todoid);

    if (todo.title.isEmpty) return;

    await DatabaseHelper.addTodo(todoEntity);
  }

  @override
  Future<void> deleteTodo(TodoEntity todo) async {
    await DatabaseHelper.deleteTodo(todo);
  }

  @override
  Future<void> updateTodo(TodoEntity todo, int index) async {
    TodoEntity todoEntity = TodoEntity(
      title: todo.title,
      description: todo.description,
      isdeleted: todo.isdeleted,
      isdone: todo.isdone,
      todoid: todo.todoid,
    );
    await DatabaseHelper.updateTodo(todoEntity);
  }

  @override
  Future<void> completedTodo(TodoEntity todo) async {
    // if (todo.isDone == true) return;

    // await DatabaseHelper.deleteTodo(TodoEntity(
    //     title: todo.title,
    //     isdeleted: todo.isdeleted,
    //     isdone: !todo.isdone,
    //     description: todo.description,
    //     todoid: todo.todoid));

    await DatabaseHelper.updateTodo(TodoEntity(
        title: todo.title,
        isdeleted: todo.isdeleted,
        isdone: !todo.isdone,
        description: todo.description,
        todoid: todo.todoid));
  }

  @override
  Future<void> restoreTodo(TodoEntity todo) async {
    await DatabaseHelper.updateTodo(TodoEntity(
        title: todo.title,
        isdeleted: false,
        isdone: todo.isdone,
        description: todo.description,
        todoid: todo.todoid));
  }

  @override
  Future<void> trashTodo(TodoEntity todo) async {
    TodoEntity todoEntity = TodoEntity(
      title: todo.title,
      description: todo.description,
      isdeleted: true,
      isdone: todo.isdone,
      todoid: todo.todoid,
    );
    await DatabaseHelper.updateTodo(todoEntity);
  }
}
