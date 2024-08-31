// lib/models/task_manager.dart

import 'task.dart';

class TaskManager {
  List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
    print('Task added successfully!');
  }

  void viewAllTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
    } else {
      for (var task in _tasks) {
        _printTaskDetails(task);
      }
    }
  }

  void viewCompletedTasks() {
    var completedTasks = _tasks.where((task) => task.isCompleted).toList();
    if (completedTasks.isEmpty) {
      print('No completed tasks.');
    } else {
      for (var task in completedTasks) {
        _printTaskDetails(task);
      }
    }
  }

  void viewPendingTasks() {
    var pendingTasks = _tasks.where((task) => !task.isCompleted).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks.');
    } else {
      for (var task in pendingTasks) {
        _printTaskDetails(task);
      }
    }
  }

  void editTask(int index,
      {String? title,
      String? description,
      DateTime? dueDate,
      bool? isCompleted}) {
    if (index < 0 || index >= _tasks.length) {
      print('Task not found.');
      return;
    }

    var task = _tasks[index];
    if (title != null) task.title = title;
    if (description != null) task.description = description;
    if (dueDate != null) task.dueDate = dueDate;
    if (isCompleted != null) task.isCompleted = isCompleted;

    print('Task updated successfully!');
  }

  void deleteTask(int index) {
    if (index < 0 || index >= _tasks.length) {
      print('Task not found.');
      return;
    }

    _tasks.removeAt(index);
    print('Task deleted successfully!');
  }

  void _printTaskDetails(Task task) {
    print('Title: ${task.title}');
    print('Description: ${task.description}');
    print('Due Date: ${task.dueDate}');
    print('Status: ${task.isCompleted ? 'Completed' : 'Pending'}');
    print('---');
  }
}
