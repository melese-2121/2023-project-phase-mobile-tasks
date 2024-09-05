import 'dart:io';
import 'task_2.dart';
import 'task_manager.dart';

// ANSI escape codes for styling
const String reset = '\x1B[0m';
const String bold = '\x1B[1m';
const String green = '\x1B[32m';
const String blue = '\x1B[34m';
const String yellow = '\x1B[33m';
const String red = '\x1B[31m';
const String cyan = '\x1B[36m';

void main() {
  final taskManager = TaskManager();

  while (true) {
    print('\n${bold}${cyan}Menu:${reset}');
    print('${green}1.${reset} Add Task ');
    print('${blue}2.${reset} View All Tasks');
    print('${yellow}3.${reset} View Completed Tasks');
    print('${yellow}4.${reset} View Pending Tasks');
    print('${blue}5.${reset} Edit Task');
    print('${red}6.${reset} Delete Task ');
    print('${red}7.${reset} Exit ');
    stdout.write('${bold}Choose an option (1-7): ${reset}');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _addTask(taskManager);
        break;
      case '2':
        taskManager.viewAllTasks();
        break;
      case '3':
        taskManager.viewCompletedTasks();
        break;
      case '4':
        taskManager.viewPendingTasks();
        break;
      case '5':
        _editTask(taskManager);
        break;
      case '6':
        _deleteTask(taskManager);
        break;
      case '7':
        print('${bold}${cyan}Exiting Task Manager. Goodbye! 👋${reset}');
        exit(0);
      default:
        print('${red}Invalid option, please try again. ❌${reset}');
    }
  }
}

void _addTask(TaskManager taskManager) {
  stdout.write('Enter title: ');
  var title = stdin.readLineSync();
  if (title == null || title.isEmpty) {
    print('${red}Title cannot be empty.${reset}');
    return;
  }

  stdout.write('Enter description: ');
  var description = stdin.readLineSync();
  if (description == null || description.isEmpty) {
    print('${red}Description cannot be empty.${reset}');
    return;
  }

  DateTime dueDate;
  while (true) {
    stdout.write('Enter due date (yyyy-mm-dd): ');
    var dueDateInput = stdin.readLineSync();
    try {
      dueDate = DateTime.parse(dueDateInput!);
      break;
    } catch (e) {
      print('${red}Invalid date format. Please use yyyy-mm-dd.${reset}');
    }
  }

  var task = Task(title: title, description: description, dueDate: dueDate);
  taskManager.addTask(task);
  print('${green}Task added successfully!${reset}');
}

void _editTask(TaskManager taskManager) {
  stdout.write('Enter task index to edit: ');
  var index = int.tryParse(stdin.readLineSync()!);
  if (index == null || index < 0) {
    print('${red}Invalid index.${reset}');
    return;
  }

  stdout.write('Enter new title (leave blank to keep current): ');
  var title = stdin.readLineSync();
  stdout.write('Enter new description (leave blank to keep current): ');
  var description = stdin.readLineSync();

  DateTime? dueDate;
  stdout
      .write('Enter new due date (leave blank to keep current, yyyy-mm-dd): ');
  var dueDateInput = stdin.readLineSync();
  if (dueDateInput != null && dueDateInput.isNotEmpty) {
    try {
      dueDate = DateTime.parse(dueDateInput);
    } catch (e) {
      print('${red}Invalid date format. Date not updated.${reset}');
    }
  }

  stdout.write('Mark as completed? (y/n): ');
  var isCompletedInput = stdin.readLineSync();
  bool isCompleted = isCompletedInput?.toLowerCase() == 'y';

  taskManager.editTask(index,
      title: title?.isEmpty ?? true ? null : title,
      description: description?.isEmpty ?? true ? null : description,
      dueDate: dueDate,
      isCompleted: isCompleted);
  print('${green}Task updated successfully!${reset}');
}

void _deleteTask(TaskManager taskManager) {
  stdout.write('Enter task index to delete: ');
  var index = int.tryParse(stdin.readLineSync()!);
  if (index == null || index < 0) {
    print('${red}Invalid index.${reset}');
    return;
  }

  taskManager.deleteTask(index);
  print('${green}Task deleted successfully!${reset}');
}
