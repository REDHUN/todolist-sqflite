import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:todoapp/features/domain/usecases/add_todo_usecase.dart';
import 'package:todoapp/features/domain/usecases/completed_todo_usecase.dart';
import 'package:todoapp/features/domain/usecases/delete_todo_usecase.dart';
import 'package:todoapp/features/domain/usecases/restore_todo_usecase.dart';
import 'package:todoapp/features/domain/usecases/trash_todo_usecase.dart';
import 'package:todoapp/features/domain/usecases/update_todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) async {
      await AddTodoUsecase().addTodo(event.todo);
      emit(GetTodosState());
      emit(TodoState());
      // emit(TodoState(allTask: List.from(state.allTask)..add(event.todo)));
    });

    on<DeleteTodo>((event, emit) async {
      await DeleteTodoUsecase().DeleteTodo(event.todo);
      //  emit(TodoState(allTask: List.from(state.allTask)));

      // emit(TodoState(allTask: List.from(state.allTask)..remove(event.todo)));

      emit(GetTodosState());
      // await Future.delayed(Duration(milliseconds: 600));
      emit(TodoState());
    });

    on<TrashTodo>((event, emit) async {
      await TrashTodoUsecase().trashTodo(event.todo);
      //  emit(TodoState(allTask: List.from(state.allTask)));

      // emit(TodoState(allTask: List.from(state.allTask)..remove(event.todo)));

      emit(GetTodosState());
      // await Future.delayed(Duration(milliseconds: 600));
      emit(TodoState());
    });

    on<UpdateTodo>((event, emit) async {
      await UpdateTodoUsecase().updateTodo(event.todo, event.index);
      emit(GetTodosState());
      //  await Future.delayed(Duration(milliseconds: 600));
      emit(TodoState());
    });

    on<CompletedTodo>((event, emit) async {
      CompletedTodoUsecase().completedTodo(event.todo);
      emit(GetTodosState());
      await Future.delayed(Duration(milliseconds: 600));
      emit(TodoState());
    });

    on<RestoreTodo>((event, emit) async {
      await RestoreTodoUsecase().restoreTodo(event.todo, event.index);
      emit(GetTodosState());
      await Future.delayed(Duration(milliseconds: 600));
      emit(TodoState());
    });
  }
}
