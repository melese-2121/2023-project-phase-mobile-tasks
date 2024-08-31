// lib/main.dart

import 'models/task.dart';
import 'models/task_manager.dart';

void main() {
  var taskManager = TaskManager();

  // Example usage
  var task1 = Task(
      'Task 1', 'Description of task 1', DateTime.now().add(Duration(days: 1)));
  taskManager.addTask(task1);

  taskManager.viewAllTasks();

  taskManager.editTask(0, title: 'Updated Task 1', isCompleted: true);

  taskManager.viewCompletedTasks();
  taskManager.viewPendingTasks();

  taskManager.deleteTask(0);
}
