import 'package:flutter_test/flutter_test.dart';
import 'package:task_route/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Test task creation with valid and invalid inputs',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find the TextField and Add button
    final Finder taskInputField = find.byKey(const Key('taskInputField'));
    final Finder addButton = find.byKey(const Key('addButton'));

    // Test empty task creation
    await tester.enterText(taskInputField, '');
    await tester.tap(addButton);
    await tester.pump();

    // Test valid task creation
    await tester.enterText(taskInputField, 'New Task');
    await tester.tap(addButton);
    await tester.pump();
  });
}
