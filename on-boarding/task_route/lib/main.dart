import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import "package:task_route/slide_page_route.dart";
import 'package:task_route/task_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo-list',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const MyHomePage());
          case '/add_task':
            return SlidePageRoute(page: CreateNewTaskPage());
          case '/taskDetail':
            final arguments = settings.arguments as Map<String, dynamic>?;
            return SlidePageRoute(
              page: TaskDetail(
                  task: arguments), // Pass arguments to the TaskDetail page
            );
          default:
            return MaterialPageRoute(builder: (context) => const MyHomePage());
        }
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> items = [
    {
      'Id': 1,
      'Type': 'U',
      'Title': 'UI/UX App Design',
      'Due Date': DateTime(2024, 9, 15),
      'Color': Colors.red,
      'Description': 'Design the user interface and experience for the new app.'
    },
    {
      'Id': 2,
      'Type': 'U',
      'Title': 'UI/UX App Design',
      'Due Date': DateTime(2024, 9, 20),
      'Color': Colors.blue,
      'Description': 'Refine the design and finalize the user experience.'
    },
    {
      'Id': 3,
      'Type': 'V',
      'Title': 'View Candidates',
      'Due Date': DateTime(2024, 10, 5),
      'Color': Colors.green,
      'Description':
          'Review the list of job candidates and prepare for interviews.'
    },
    {
      'Id': 4,
      'Type': 'F',
      'Title': 'Football Dribbling',
      'Due Date': DateTime(2024, 10, 10),
      'Color': Colors.orange,
      'Description': 'Practice dribbling techniques and improve ball control.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Todo List',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (context) => <String>[
              'Option 1',
              'Option 2',
            ]
                .map((choice) =>
                    PopupMenuItem(value: choice, child: Text(choice)))
                .toList(),
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
                    width: 180, height: 190)),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Tasks List',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/taskDetail',
                          arguments: item,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.white, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Border radius
                        ),
                        elevation: 5, // Similar to the shadow in the Container
                        shadowColor: Colors.grey.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(item['Type'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54)),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(item['Title'],
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                    DateFormat('MMMM d, yyyy')
                                        .format(item['Due Date']),
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w800)),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 3,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: item['Color'],
                                  boxShadow: [
                                    BoxShadow(
                                      color: item['Color']!.withOpacity(
                                          0.5), // Adjust opacity for shadow effect
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset:
                                          const Offset(1, 1), // Shadow position
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_task');
                },
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

class CreateNewTaskPage extends StatefulWidget {
  @override
  _CreateNewTaskPageState createState() => _CreateNewTaskPageState();
}

class _CreateNewTaskPageState extends State<CreateNewTaskPage> {
  String? _selectedTask;
  DateTime? _selectedDate;
  final TextEditingController _descriptionController = TextEditingController();

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

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Create new task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 216, 214, 214),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Main task name',
                  style: TextStyle(
                      color: Color(0xFFEE6F57), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 40,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'UI/UX App Design',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                        value: _selectedTask,
                        items: _tasks.map((String task) {
                          return DropdownMenuItem<String>(
                            value: task,
                            child: Text(task),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTask = newValue;
                          });
                        },
                        icon: const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Due date',
                  style: TextStyle(
                      color: Color(0xFFEE6F57), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: InkWell(
                    onTap: () => _selectDate(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedDate == null
                                ? 'Select Date'
                                : DateFormat('yyyy-MM-dd')
                                    .format(_selectedDate!),
                            style: TextStyle(
                                color: _selectedDate == null
                                    ? const Color.fromARGB(255, 109, 108, 108)
                                    : const Color.fromARGB(255, 92, 92, 92),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          const Icon(Icons.date_range_outlined,
                              color: Color(0xFFEE6F57)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Description',
                  style: TextStyle(
                      color: Color(0xFFEE6F57), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      hintText: 'Enter task description',
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEE6F57)),
                      onPressed: () {},
                      child: const Text('Add Task',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
