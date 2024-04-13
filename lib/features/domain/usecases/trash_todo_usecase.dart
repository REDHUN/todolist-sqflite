import 'package:todoapp/features/data/respository/todo_repoimpl.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/respository/todo_repo.dart';

class TrashTodoUsecase {
  TodoRepo todoRepo = TodoRepoImpl();
  Future<void> trashTodo(TodoEntity todo) {
    return todoRepo.trashTodo(todo);
  }
}
