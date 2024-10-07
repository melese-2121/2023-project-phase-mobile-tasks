import "../entities/todo.dart";

abstract class TodoRepository {
  Future<List<Todo>> getAllTodos();
  Future<void> addTodo(Todo todo);
  Future<void> deleteTodoById(String id);
  Future<void> updateTodo(Todo todo);
}
