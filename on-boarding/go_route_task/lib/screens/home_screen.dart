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
      title: 'todo-list',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
      'Id': "1",
      'Type': 'U',
      'Title': 'UI/UX App Design',
      'Due Date': DateTime(2024, 9, 15),
      'Color': Colors.red,
      'Description':
          'Design the user interface and user experience for the new app, focusing on usability and aesthetics.'
    },
    {
      'Id': "2",
      'Type': 'U',
      'Title': 'UI/UX App Design',
      'Due Date': DateTime(2024, 9, 20),
      'Color': Colors.blue,
      'Description':
          'Finalize the UI/UX design and prepare assets for development, ensuring all user flows are intuitive.'
    },
    {
      'Id': "3",
      'Type': 'V',
      'Title': 'View Candidates',
      'Due Date': DateTime(2024, 10, 5),
      'Color': Colors.green,
      'Description':
          'Review and evaluate job candidates for the open position, focusing on qualifications and fit for the team.'
    },
    {
      'Id': "4",
      'Type': 'F',
      'Title': 'Football Dribbling',
      'Due Date': DateTime(2024, 10, 10),
      'Color': Colors.orange,
      'Description':
          'Practice and improve dribbling skills for the upcoming football match, focusing on control and agility.'
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
                    width: 140, height: 140)),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Tasks List',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListView(
                children: items
                    .map((item) => MouseRegion(
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
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3))
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              child: Text(item['Title'],
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black87)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
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
                                              offset: const Offset(
                                                  1, 1), // Shadow position
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
                        ))
                    .toList(),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => context.goNamed("addTask"),
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
