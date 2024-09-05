class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return 'Title: $title\nDescription: $description\nDue Date: $dueDate\nStatus: ${isCompleted ? 'Completed' : 'Pending'}\n';
  }
}
