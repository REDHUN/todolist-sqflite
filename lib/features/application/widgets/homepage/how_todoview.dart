// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todoapp/features/application/bloc/todo_bloc.dart';
// import 'package:todoapp/features/application/services/colors.dart';
// import 'package:todoapp/features/application/services/database_helper.dart';
// import 'package:todoapp/features/application/widgets/homepage/todo_update_page.dart';
// import 'package:todoapp/features/domain/entities/todo_entity.dart';

// class TodoView extends StatefulWidget {
//   TodoView({super.key});

//   @override
//   State<TodoView> createState() => _TodoViewState();
// }

// class _TodoViewState extends State<TodoView> {
//   var data = DatabaseHelper.getAllTodos();
//   List<TodoEntity>? _todos = [];
//   void _refreshtodos() async {
//     List<TodoEntity>? data = await DatabaseHelper.getAllTodos();
//     setState(() {
//       _todos = data;
//       // print('ddddddddddddddd');
//     });
//   }

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _refreshtodos();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget textDecoration;
//     return Expanded(
//         child: Column(
//       children: [
//         Expanded(
//           child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
//             if (_todos != null) {
//               // print('hello');
//               int completedTask = 0;
//               int PendingTask = _todos!.length;
//               for (int i = 0; i < _todos!.length; i++) {
//                 if (_todos![i].isdone) {
//                   completedTask++;
//                   PendingTask--;
//                 }
//               }
//               int t = 0;
//               if (state is GetTodosState) {
//                 _refreshtodos();

//                 print('hfffffffffffffff');
//                 return Scaffold(
//                   body: Center(child: CircularProgressIndicator()),
//                 );
//               }
//               return Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 30,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Pending  Tasks : $PendingTask",
//                           style: TextStyle(
//                               fontFamily: 'NotoSans-Bold',
//                               color: AppColor.appBarColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Container(
//                           height: 20,
//                           width: 2,
//                           decoration: BoxDecoration(
//                               border: Border.all(color: AppColor.appBarColor)),
//                         ),
//                         Text(
//                           "Completed Tasks : $completedTask",
//                           style: TextStyle(
//                               fontFamily: 'NotoSans-Bold',
//                               color: AppColor.appBarColor,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                         itemCount: _todos!.length,
//                         itemBuilder: (context, index) {
//                           textDecoration = Text(
//                             _todos![index].title.toString(),
//                             style: TextStyle(
//                                 fontFamily: 'NotoSans-Bold',
//                                 color: AppColor.appBarTextColor,
//                                 fontWeight: FontWeight.bold),
//                           );
//                           if (_todos![index].isdone) {
//                             textDecoration = Text(
//                               _todos![index].title,
//                               style: TextStyle(
//                                   decoration: TextDecoration.lineThrough,
//                                   fontFamily: 'NotoSans-Bold',
//                                   color: Colors.amber,
//                                   fontWeight: FontWeight.bold),
//                             );
//                           }

//                           return Container(
//                             height: 80,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: AppColor.appBarColor,
//                             ),
//                             margin: EdgeInsets.symmetric(
//                               vertical: 4,
//                               horizontal: 15,
//                             ),
//                             child: Center(
//                               child: ListTile(
//                                 onTap: () {
//                                   showModalBottomSheet(
//                                       backgroundColor: Colors.transparent,
//                                       isScrollControlled: true,
//                                       context: context,
//                                       builder: (ctx) => TodoUpdatePage(
//                                             isdeleted: _todos![index].isdeleted,
//                                             isdone: _todos![index].isdone,
//                                             id: _todos![index].todoid,
//                                             title: _todos![index].title,
//                                             description:
//                                                 _todos![index].description,
//                                             index: index,
//                                           ));
//                                 },
//                                 onLongPress: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context2) {
//                                       return AlertDialog(
//                                         title: const Text("Delete Note"),
//                                         content: const Text(
//                                             "are you sure you want to delete this task permenetly."),
//                                         actions: [
//                                           TextButton(
//                                             child: const Text("Delete"),
//                                             onPressed: () {
//                                               context.read<TodoBloc>().add(
//                                                     TrashTodo(
//                                                         todo: _todos![index]),
//                                                   );

//                                               Navigator.pop(context);
//                                               _refreshtodos();
//                                             },
//                                           ),
//                                           TextButton(
//                                             child: const Text("No"),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );

//                                   if (_todos![index].isdone) {
//                                     completedTask--;
//                                   }
//                                 },
//                                 title: textDecoration,
//                                 trailing: Checkbox(
//                                   side: BorderSide(
//                                       color: AppColor.appBarTextColor,
//                                       width: 3),
//                                   value: _todos![index].isdone,
//                                   onChanged: (value) {
//                                     _refreshtodos();
//                                     if (!_todos![index].isdone) completedTask++;
//                                     if (_todos![index].isdone) completedTask--;
//                                     context.read<TodoBloc>().add(
//                                           CompletedTodo(todo: _todos![index]),
//                                         );
//                                   },
//                                 ),
//                                 subtitle: Text(
//                                   _todos![index].description,
//                                   style: TextStyle(
//                                       fontFamily: 'NotoSans-Bold',
//                                       color: AppColor.appBarTextColor
//                                           .withOpacity(0.7)),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               );
//             }
//             return const Center(
//               child: Text('No notes yet'),
//             );
//           }),
//         ),
//       ],
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/application/bloc/todo_bloc.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/application/widgets/homepage/todo_update_page.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        Widget textDecoration;
        return Column(
          children: [
            Expanded(
              child: FutureBuilder<List<TodoEntity>?>(
                future: DatabaseHelper.getAllTodos(),
                builder: (context, AsyncSnapshot<List<TodoEntity>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      int completedTask = 0;
                      int PendingTask = snapshot.data!.length;
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        if (snapshot.data![i].isdone) {
                          completedTask++;
                          PendingTask--;
                        }
                      }
                      return BlocBuilder<TodoBloc, TodoState>(
                        builder: (context, state) {
                          if (state is GetTodosState) {
                            return const Scaffold(
                              body: Center(child: CircularProgressIndicator()),
                            );
                          }
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Pending  Tasks : $PendingTask",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans-Bold',
                                          color: AppColor.appBarColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.appBarColor)),
                                    ),
                                    Text(
                                      "Completed Tasks : $completedTask",
                                      style: TextStyle(
                                          fontFamily: 'NotoSans-Bold',
                                          color: AppColor.appBarColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      textDecoration = Text(
                                        snapshot.data![index].title.toString(),
                                        style: TextStyle(
                                            fontFamily: 'NotoSans-Bold',
                                            color: AppColor.appBarTextColor,
                                            fontWeight: FontWeight.bold),
                                      );
                                      if (snapshot.data![index].isdone) {
                                        textDecoration = Text(
                                          snapshot.data![index].title,
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontFamily: 'NotoSans-Bold',
                                              color: Colors.amber,
                                              fontWeight: FontWeight.bold),
                                        );
                                      }

                                      return Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColor.appBarColor,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 15,
                                        ),
                                        child: Center(
                                          child: ListTile(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  isScrollControlled: true,
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
                                                            .data![index].title,
                                                        description: snapshot
                                                            .data![index]
                                                            .description,
                                                        index: index,
                                                      ));
                                            },
                                            onLongPress: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context2) {
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
                                                              .read<TodoBloc>()
                                                              .add(
                                                                TrashTodo(
                                                                    todo: snapshot
                                                                            .data![
                                                                        index]),
                                                              );
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: const Text("No"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );

                                              if (snapshot
                                                  .data![index].isdone) {
                                                completedTask--;
                                              }
                                            },
                                            title: textDecoration,
                                            trailing: Checkbox(
                                              side: BorderSide(
                                                  color:
                                                      AppColor.appBarTextColor,
                                                  width: 3),
                                              value:
                                                  snapshot.data![index].isdone,
                                              onChanged: (value) {
                                                if (!snapshot.data![index]
                                                    .isdone) completedTask++;
                                                if (snapshot.data![index]
                                                    .isdone) completedTask--;
                                                context.read<TodoBloc>().add(
                                                      CompletedTodo(
                                                          todo: snapshot
                                                              .data![index]),
                                                    );
                                              },
                                            ),
                                            subtitle: Text(
                                              snapshot.data![index].description,
                                              style: TextStyle(
                                                  fontFamily: 'NotoSans-Bold',
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
                  return const Center(
                    child: Text("No Note Added Yet!!!!"),
                  );
                },
              ),
            ),
          ],
        );
      },
    ));
  }
}
