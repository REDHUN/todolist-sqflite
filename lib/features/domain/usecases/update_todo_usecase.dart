import 'package:todoapp/features/data/respository/todo_repoimpl.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/respository/todo_repo.dart';

class UpdateTodoUsecase {
  TodoRepo todoRepo = TodoRepoImpl();
  Future<void> updateTodo(TodoEntity todo, int index) {
    return todoRepo.updateTodo(todo, index);
  }
}
