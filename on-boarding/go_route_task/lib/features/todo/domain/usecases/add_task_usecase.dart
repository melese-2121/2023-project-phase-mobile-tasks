import '../entities/todo.dart';

class AddTaskUseCase {
  final List<Todo> _todoList; // Ensure to use Todo instead of Task

  AddTaskUseCase(this._todoList);

  void execute(Todo task) {
    _todoList.add(task);
  }
}
