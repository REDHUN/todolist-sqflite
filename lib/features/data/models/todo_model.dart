import 'package:todoapp/features/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {super.todoid,
      required super.title,
      required super.isdeleted,
      required super.isdone,
      required super.description});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [super.title, super.description, super.isdeleted, super.isdone];
}
