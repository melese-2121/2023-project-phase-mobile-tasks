import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatelessWidget {
  final Map<String, dynamic>?
      task; // This should match the type you are passing

  const TaskDetail({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (task == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Task Detail'),
        ),
        body: const Center(child: Text('No task data available')),
      );
    }

    final type = task!['Type'] ?? 'No Type';
    final title = task!['Title'] ?? 'No Title';
    final dueDate = task!['Due Date'] != null
        ? DateFormat('MMMM d, yyyy').format(task!['Due Date'])
        : 'No Date';
    final color = task!['Color'] ?? Colors.grey;
    final description = task!['Description'] ?? 'No Description';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left,
                size: 37, color: Color(0xFFEE6F57)),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Task Detail',
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/details-man.png',
                width: 180,
                height: 190,
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                'Type',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$title',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$description",
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Deadline',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    dueDate,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
