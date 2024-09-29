class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final String type;
  final int
      color; // Store color as an integer to avoid direct dependency on `MaterialColor`

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.isCompleted,
    required this.type,
    required this.color,
  });
}
