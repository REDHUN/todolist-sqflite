import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/features/application/bloc/todo_bloc.dart';
import 'package:todoapp/features/application/services/colors.dart';
import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/application/widgets/homepage/appbar.dart';
import 'package:todoapp/features/application/widgets/homepage/appdrawer.dart';
import 'package:todoapp/features/application/widgets/homepage/bottom_model_sheet.dart';
import 'package:todoapp/features/application/widgets/homepage/how_todoview.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: AppColor.appBarTextColor)),
        backgroundColor: AppColor.appBarColor,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (ctx) => const BottomModelSheet());
        },
        child: Icon(
          Icons.add,
          color: AppColor.appBarTextColor,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return FutureBuilder<List<TodoEntity>?>(
                    future: DatabaseHelper.getDeletedTodos(),
                    builder:
                        (context, AsyncSnapshot<List<TodoEntity>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return AppBarView(
                            trashLength: snapshot.data!.length,
                          );
                        }
                      }
                      return AppBarView(
                        trashLength: 0,
                      );
                    });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TodoView()
          ],
        ),
      ),
    );
  }
}
