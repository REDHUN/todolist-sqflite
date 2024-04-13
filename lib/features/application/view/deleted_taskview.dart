import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/application/bloc/todo_bloc.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/application/widgets/homepage/todo_update_page.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class DeletedTaskView extends StatefulWidget {
  const DeletedTaskView({super.key});

  @override
  State<DeletedTaskView> createState() => _DeleteTaskState();
}

class _DeleteTaskState extends State<DeletedTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBarColor,
          title: Text(
            "Deleted Task",
            style: TextStyle(
                fontFamily: 'NotoSans-Bold',
                color: AppColor.appBarTextColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    return FutureBuilder<List<TodoEntity>?>(
                      future: DatabaseHelper.getDeletedTodos(),
                      builder:
                          (context, AsyncSnapshot<List<TodoEntity>?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (snapshot.hasData) {
                          if (snapshot.data != null) {
                            return BlocBuilder<TodoBloc, TodoState>(
                              builder: (context, state) {
                                Widget textDecoration;
                                if (state is GetTodosState) {
                                  return Scaffold(
                                    body: Center(
                                        child: CircularProgressIndicator()),
                                  );
                                }
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 30,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [],
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            textDecoration = Text(
                                              snapshot.data![index].title
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'NotoSans-Bold',
                                                  color:
                                                      AppColor.appBarTextColor,
                                                  fontWeight: FontWeight.bold),
                                            );
                                            if (snapshot.data![index].isdone) {
                                              textDecoration = Text(
                                                snapshot.data![index].title,
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontFamily: 'NotoSans-Bold',
                                                    color: Colors.amber,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              );
                                            }

                                            return Container(
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColor.appBarColor,
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 15,
                                              ),
                                              child: Center(
                                                child: ListTile(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isScrollControlled:
                                                            true,
                                                        context: context,
                                                        builder: (ctx) =>
                                                            TodoUpdatePage(
                                                              isdeleted: snapshot
                                                                  .data![index]
                                                                  .isdeleted,
                                                              isdone: snapshot
                                                                  .data![index]
                                                                  .isdone,
                                                              id: snapshot
                                                                  .data![index]
                                                                  .todoid,
                                                              title: snapshot
                                                                  .data![index]
                                                                  .title,
                                                              description: snapshot
                                                                  .data![index]
                                                                  .description,
                                                              index: index,
                                                            ));
                                                  },
                                                  onLongPress: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context2) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Delete Note"),
                                                          content: const Text(
                                                              "are you sure you want to delete this task permenetly."),
                                                          actions: [
                                                            TextButton(
                                                              child: const Text(
                                                                  "Delete"),
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        TodoBloc>()
                                                                    .add(
                                                                      DeleteTodo(
                                                                          todo:
                                                                              snapshot.data![index]),
                                                                    );
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                  "No"),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  title: textDecoration,
                                                  trailing: IconButton(
                                                    icon: Icon(
                                                      Icons.restore,
                                                      color: AppColor
                                                          .appBarTextColor,
                                                    ),
                                                    onPressed: () {
                                                      context
                                                          .read<TodoBloc>()
                                                          .add(RestoreTodo(
                                                              todo: snapshot
                                                                  .data![index],
                                                              index: index));
                                                    },
                                                  ),
                                                  subtitle: Text(
                                                    snapshot.data![index]
                                                        .description,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'NotoSans-Bold',
                                                        color: AppColor
                                                            .appBarTextColor
                                                            .withOpacity(0.7)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          return const Center(
                            child: Text('No notes yet'),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
