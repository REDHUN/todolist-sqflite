import 'package:todoapp/features/data/respository/todo_repoimpl.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/respository/todo_repo.dart';

class AddTodoUsecase {
  TodoRepo todoRepo = TodoRepoImpl();
  Future<void> addTodo(TodoEntity todo) async {
    await todoRepo.addTodo(todo);
  }
}
