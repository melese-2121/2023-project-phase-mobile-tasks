import '../../domain/entities/todo.dart';

abstract class TodoRemoteDataSource {
  Future<List<Todo>> fetchTodosFromServer();
  Future<void> addTodoToServer(Todo todo);
  Future<void> deleteTodoFromServer(String id);
  Future<void> updateTodoOnServer(Todo todo);
}

abstract class TodoLocalDataSource {
  Future<List<Todo>> fetchTodosFromDb();
  Future<void> addTodoToDb(Todo todo);
  Future<void> deleteTodoFromDb(String id);
  Future<void> updateTodoInDb(Todo todo);
}
