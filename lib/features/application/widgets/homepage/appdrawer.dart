import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/application/bloc/todo_bloc.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/application/view/deleted_taskview.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return Drawer(
          child: FutureBuilder<List<TodoEntity>?>(
              future: DatabaseHelper.getDeletedTodos(),
              builder: (context, AsyncSnapshot<List<TodoEntity>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                late int trashLength;

                if (snapshot.data != null) {
                  trashLength = snapshot.data!.length;
                }
                if (snapshot.data == null) {
                  trashLength = 0;
                }

                return ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      color: AppColor.appBarColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "USER",
                              style: TextStyle(
                                  fontFamily: 'NotoSans-Bold',
                                  fontSize: 20,
                                  color: AppColor.appBarTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // DrawerHeader(
                    //   decoration: BoxDecoration(
                    //     color: AppColor.appBarColor,
                    //   ), //BoxDecoration
                    //   child:

                    //    UserAccountsDrawerHeader(
                    //     decoration: BoxDecoration(
                    //       color: AppColor.appBarColor,
                    //     ),
                    //     accountName: Text(
                    //       "Redhun",
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     accountEmail: Text("redhuns123@gmail.com"),

                    //     currentAccountPicture: CircleAvatar(
                    //       backgroundColor: Colors.white,
                    //       child: Text(
                    //         "R",
                    //         style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    //       ), //Text
                    //     ), //circleAvatar
                    //   ), //UserAccountDrawerHeader
                    // ), //DrawerHeader
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        "My Profile",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            color: AppColor.appBarColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.auto_delete),
                      trailing: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 12,
                          child: Text(trashLength.toString())),
                      title: Text(
                        "Trash",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            color: AppColor.appBarColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeletedTaskView()));
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.workspace_premium),
                      title: Text(
                        "About Developer",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            color: AppColor.appBarColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                            fontFamily: 'NotoSans-Bold',
                            color: AppColor.appBarColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
