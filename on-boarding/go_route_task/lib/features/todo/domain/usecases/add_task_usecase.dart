import '../entities/task.dart';

class AddTaskUseCase {
  final List<Task> _taskList;

  AddTaskUseCase(this._taskList);

  void execute(Task task) {
    // Add the task to the list
    _taskList.add(task);
  }
}
