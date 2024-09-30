import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_route_task/features/todo/data/models/todo_model.dart';

void main() {
  group('TodoModel', () {
    test('should correctly convert from JSON', () {
      final json = {
        'Id': '1',
        'Type': 'U',
        'Title': 'UI/UX App Design',
        'Due Date': '2024-09-15T00:00:00.000',
        'Color': Colors.red.value,
        'Description': 'Design the app UI/UX',
        'Completed': false,
      };

      final todo = TodoModel.fromJson(json);

      expect(todo.id, '1');
      expect(todo.type, 'U');
      expect(todo.title, 'UI/UX App Design');
      expect(todo.dueDate, DateTime(2024, 9, 15));
      expect(todo.color, Colors.red);
      expect(todo.description, 'Design the app UI/UX');
      expect(todo.completed, false);
    });

    test('should correctly convert to JSON', () {
      final todo = TodoModel(
        id: '1',
        type: 'U',
        title: 'UI/UX App Design',
        dueDate: DateTime(2024, 9, 15),
        color: Colors.red,
        description: 'Design the app UI/UX',
        completed: false,
      );

      final json = todo.toJson();

      expect(json['Id'], '1');
      expect(json['Type'], 'U');
      expect(json['Title'], 'UI/UX App Design');
      expect(json['Due Date'], '2024-09-15T00:00:00.000');
      expect(json['Color'], Colors.red.value);
      expect(json['Description'], 'Design the app UI/UX');
      expect(json['Completed'], false);
    });
  });
}
