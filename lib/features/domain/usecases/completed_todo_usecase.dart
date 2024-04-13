import 'package:todoapp/features/data/respository/todo_repoimpl.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/respository/todo_repo.dart';

class CompletedTodoUsecase {
  TodoRepo todoRepo = TodoRepoImpl();
  Future<void> completedTodo(TodoEntity todo) {
    return todoRepo.completedTodo(todo);
  }
}
