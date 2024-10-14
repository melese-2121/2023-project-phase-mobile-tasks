import '../../domain/entities/todo.dart';

abstract class TodoLocalDataSource {
  Future<List<Todo>> fetchTodosFromDb();
  Future<void> addTodoToDb(Todo todo);
  Future<void> deleteTodoFromDb(String id);
  Future<void> updateTodoInDb(Todo todo);
}
