import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEE6F57),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/stick-man-painting-on-canvas.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                width: 160.0,
                height: 35.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateNewTaskPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C8CE9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                  ),
                  child: const Text('Get Started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14)),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
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
