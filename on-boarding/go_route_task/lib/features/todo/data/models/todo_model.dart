import 'package:flutter/material.dart';

class TodoModel {
  final String id;
  final String type;
  final String title;
  final DateTime dueDate;
  final Color color;
  final String description;
  final bool completed;

  TodoModel({
    required this.id,
    required this.type,
    required this.title,
    required this.dueDate,
    required this.color,
    required this.description,
    required this.completed,
  });

  // Converts JSON to TodoModel
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['Id'] as String,
      type: json['Type'] as String,
      title: json['Title'] as String,
      dueDate: DateTime.parse(json['Due Date'] as String),
      color: Color(json['Color'] as int),
      description: json['Description'] as String,
      completed: json['Completed'] as bool,
    );
  }

  // Converts TodoModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Type': type,
      'Title': title,
      'Due Date': dueDate.toIso8601String(),
      'Color': color.value,
      'Description': description,
      'Completed': completed,
    };
  }
}
