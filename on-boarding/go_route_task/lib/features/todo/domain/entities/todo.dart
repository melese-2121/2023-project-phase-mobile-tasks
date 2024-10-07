class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  // Factory method to create a Todo object from a JSON map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // Convert a Todo object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }
}
