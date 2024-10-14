import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/entities/todo.dart';
import 'todo_local_data_source.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  static const String tableName = 'todos';

  // Initialize the database
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY, title TEXT, description TEXT, dueDate TEXT, isCompleted INTEGER, type TEXT, color INTEGER)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<Todo>> fetchTodosFromDb() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert List<Map<String, dynamic>> to List<Todo>
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        dueDate: DateTime.parse(maps[i]['dueDate']),
        isCompleted: maps[i]['isCompleted'] == 1,
      );
    });
  }

  @override
  Future<void> addTodoToDb(Todo todo) async {
    final db = await _getDatabase();

    await db.insert(
      tableName,
      {
        'id': todo.id,
        'title': todo.title,
        'description': todo.description,
        'dueDate': todo.dueDate.toIso8601String(),
        'isCompleted': todo.isCompleted ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> deleteTodoFromDb(String id) async {
    final db = await _getDatabase();

    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> updateTodoInDb(Todo todo) async {
    final db = await _getDatabase();

    await db.update(
      tableName,
      {
        'id': todo.id,
        'title': todo.title,
        'description': todo.description,
        'dueDate': todo.dueDate.toIso8601String(),
        'isCompleted': todo.isCompleted ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
