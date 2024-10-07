import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> items = [
    {
      'Id': "1",
      'Type': 'U',
      'Title': 'UI/UX App Design',
      'Due Date': DateTime(2024, 9, 15),
      'Color': Colors.red,
      'Description':
          'Design the user interface and user experience for the new app, focusing on usability and aesthetics.',
      'Completed': false,
    },
    {
      'Id': "2",
      'Type': 'U',
      'Title': 'Finalize UI/UX Design',
      'Due Date': DateTime(2024, 9, 20),
      'Color': Colors.blue,
      'Description':
          'Prepare assets for development, ensuring all user flows are intuitive.',
      'Completed': false,
    },
    {
      'Id': "3",
      'Type': 'V',
      'Title': 'View Candidates',
      'Due Date': DateTime(2024, 10, 5),
      'Color': Colors.green,
      'Description':
          'Review candidates for the open position, focusing on qualifications.',
      'Completed': false,
    },
    {
      'Id': "4",
      'Type': 'F',
      'Title': 'Football Dribbling Practice',
      'Due Date': DateTime(2024, 10, 10),
      'Color': Colors.orange,
      'Description': 'Improve dribbling skills for the upcoming match.',
      'Completed': false,
    },
  ];

  void _toggleTaskCompletion(String taskId) {
    setState(() {
      try {
        // Attempt to find the task and toggle its completion status
        final task = items.firstWhere((task) => task['Id'] == taskId);
        task['Completed'] = !task['Completed'];
      } catch (e) {
        // Handle error if the task is not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error toggling task completion: $e')),
        );
      }
    });
  }

  // Navigate to the CreateTaskScreen and handle the result
  void _navigateToCreateTaskScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateNewTaskScreen(),
      ),
    );

    // Check if a new task was added and update the list
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        items.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Todo List',
          style: TextStyle(
              fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle selected value from the popup menu
            },
            itemBuilder: (context) =>
                ['Option 1', 'Option 2', 'Option 3'].map((choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            icon: const Icon(Icons.more_vert, size: 30),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Image.asset('assets/todo-man.png',
                    width: 140, height: 140)),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tasks List',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.goNamed(
                        "viewEditTask",
                        pathParameters: {"id": item["Id"]},
                        extra: item,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: item['Completed']
                              ? Colors.grey.shade300
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: item['Completed'],
                              onChanged: (bool? value) {
                                _toggleTaskCompletion(item['Id']);
                              },
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    item['Type'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          item['Title'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: item['Completed']
                                                ? Colors.grey
                                                : Colors.black87,
                                            decoration: item['Completed']
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    DateFormat('MMMM d, yyyy')
                                        .format(item['Due Date']),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: 3,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: item['Color'],
                                    boxShadow: [
                                      BoxShadow(
                                        color: item['Color']!.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => _navigateToCreateTaskScreen(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEE6F57),
                  fixedSize: const Size(200, 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  elevation: 0,
                ),
                child: const Text('Create Task',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

// Dummy screen for task creation
class CreateNewTaskScreen extends StatelessWidget {
  const CreateNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Task")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate task creation and return the new task
            Navigator.pop(
              context,
              {
                'Id': '5',
                'Type': 'N',
                'Title': 'New Task',
                'Due Date': DateTime.now(),
                'Color': Colors.purple,
                'Description': 'A new task description',
                'Completed': false,
              },
            );
          },
          child: const Text('Save Task'),
        ),
      ),
    );
  }
}
