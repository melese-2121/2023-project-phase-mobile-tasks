import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/add_task_usecase.dart';

class CreateNewTaskScreen extends StatefulWidget {
  final AddTaskUseCase addTaskUseCase;

  const CreateNewTaskScreen({Key? key, required this.addTaskUseCase})
      : super(key: key);

  @override
  _CreateNewTaskScreenState createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  String? _selectedTask;
  DateTime? _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isCompleted = false;

  final List<String> _tasks = [
    'UI/UX App Design',
    'Web Development',
    'Mobile App Development'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _addTask() {
    if (_selectedTask != null &&
        _selectedDate != null &&
        _descriptionController.text.isNotEmpty) {
      final newTask = Todo(
        // Use the Todo class
        id: DateTime.now().toString(),
        title: _selectedTask!,
        description: _descriptionController.text,
        dueDate: _selectedDate!,
        isCompleted: _isCompleted,
      );

      widget.addTaskUseCase
          .execute(newTask); // Ensure AddTaskUseCase takes a Todo
      context.pop(); // Navigate back to the previous screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Dropdown
            DropdownButton<String>(
              hint: const Text('Select Task'),
              value: _selectedTask,
              items: _tasks.map((task) {
                return DropdownMenuItem<String>(
                  value: task,
                  child: Text(task),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedTask = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            // Date Picker
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedDate == null
                        ? 'Select Date'
                        : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
                    const Icon(Icons.date_range),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Description Input
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Task Description',
              ),
            ),
            const SizedBox(height: 16),
            // Completed Checkbox
            Row(
              children: [
                Checkbox(
                  value: _isCompleted,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCompleted = value ?? false;
                    });
                  },
                ),
                const Text('Mark as Completed'),
              ],
            ),
            const SizedBox(height: 24),
            // Add Task Button
            ElevatedButton(
              onPressed: _addTask,
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
