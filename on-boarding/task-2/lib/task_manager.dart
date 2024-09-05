// lib/task_manager.dart
import 'task_2.dart';

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      for (var task in tasks) {
        print(task);
      }
    }
  }

  void viewCompletedTasks() {
    var completedTasks = tasks.where((task) => task.isCompleted).toList();
    if (completedTasks.isEmpty) {
      print('No completed tasks.');
    } else {
      for (var task in completedTasks) {
        print(task);
      }
    }
  }

  void viewPendingTasks() {
    var pendingTasks = tasks.where((task) => !task.isCompleted).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks.');
    } else {
      for (var task in pendingTasks) {
        print(task);
      }
    }
  }

  void editTask(int index,
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? isCompleted}) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task index.');
      return;
    }
    var task = tasks[index];
    if (title != null) task.title = title;
    if (description != null) task.description = description;
    if (dueDate != null) task.dueDate = dueDate;
    if (isCompleted != null) task.isCompleted = isCompleted;
  }

  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) {
      print('Invalid task index.');
      return;
    }
    tasks.removeAt(index);
  }
}
