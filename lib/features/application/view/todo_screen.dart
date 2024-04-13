import 'package:flutter/material.dart';
import 'package:todoapp/features/application/services/database_helper.dart';
import 'package:todoapp/features/application/widgets/homepage/bottom_model_sheet.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Notes'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (ctx) => const BottomModelSheet());

            // await Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const NoteScreen()));
            // setState(() {});
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder<List<TodoEntity>?>(
          future: DatabaseHelper.getAllTodos(),
          builder: (context, AsyncSnapshot<List<TodoEntity>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].description),
                  ),
                  itemCount: snapshot.data!.length,
                );
              }
              return const Center(
                child: Text('No notes yet'),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
