import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/application/bloc/todo_bloc.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';
import 'package:uuid/uuid.dart';

class BottomModelSheet extends StatefulWidget {
  const BottomModelSheet({super.key});

  @override
  State<BottomModelSheet> createState() => _BottomModelSheetState();
}

class _BottomModelSheetState extends State<BottomModelSheet> {
  var uuid = Uuid();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.appBarIconColor,
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 300),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.top),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        20.0, 20.0, 20.0, 0.0), // content padding
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'title', border: InputBorder.none),
                    ),
                  ) // From with TextField inside

                  ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.top),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        20.0, 20.0, 20.0, 0.0), // content padding
                    child: TextField(
                      minLines: 4,
                      maxLines: 6,
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: 'description', border: InputBorder.none),
                    ),
                  ) // From with TextField inside

                  ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(AddTodo(
                          todo: TodoEntity(
                              todoid: uuid.v4(),
                              description: descriptionController.text,
                              title: titleController.text,
                              isdone: false,
                              isdeleted: false)));
                      // BlocProvider.of<TodoBloc>(context).add(
                      //     AddTodo(todo: TodoEntity(title: titleController.text)));
                      // context.read()<TodoBloc>().add(
                      //     AddTodo(todo: TodoEntity(title: titleController.text)));
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.appBarColor)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.appBarColor)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'close',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
