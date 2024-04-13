import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/features/domain/entities/todo_entity.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'T.db';

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            "CREATE TABLE T(todoid TEXT NOT NULL, title TEXT NOT NULL, description TEXT NOT NULL,isdone INTEGER ,isdeleted INTEGER  );"),
        version: _version);
  }

  static Future<int> addTodo(TodoEntity todo) async {
    final db = await _getDB();
    return await db.insert("T", todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    //   return db.delete('Todo');
  }

  static Future<int> deleteTodo(TodoEntity todo) async {
    final db = await _getDB();
    return await db.delete("T", where: 'todoid=?', whereArgs: [todo.todoid]);

    //   return db.delete('Todo');
  }

  static Future<int> updateTodo(TodoEntity todo) async {
    final db = await _getDB();
    return await db.update("T", todo.toMap(),
        where: 'todoid=?',
        whereArgs: [todo.todoid],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<TodoEntity>?> getAllTodos() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps =
        await db.query('T', orderBy: 'isdone=1', where: 'isdeleted=0');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length,
        (index) => TodoEntity(
            todoid: maps[index]['todoid'],
            title: maps[index]['title'],
            description: maps[index]['description'],
            isdone: maps[index]['isdone'] == 1 ? true : false,
            isdeleted: maps[index]['isdeleted'] == 1 ? true : false));
  }

  static Future<List<TodoEntity>?> getDeletedTodos() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps =
        await db.query('T', where: 'isdeleted=1');
    if (maps.isEmpty) {
      return null;
    }
    return List.generate(
        maps.length,
        (index) => TodoEntity(
            todoid: maps[index]['todoid'],
            title: maps[index]['title'],
            description: maps[index]['description'],
            isdone: maps[index]['isdone'] == 1 ? true : false,
            isdeleted: maps[index]['isdeleted'] == 1 ? true : false));
  }
}
