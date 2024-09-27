import 'package:flutter_test/flutter_test.dart';
import 'package:task_route/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Test task listing displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('No tasks available'), findsOneWidget);

    // Add a new task
    final Finder taskInputField = find.byKey(const Key('taskInputField'));
    final Finder addButton = find.byKey(const Key('addButton'));

    await tester.enterText(taskInputField, 'Test Task 1');
    await tester.tap(addButton);
    await tester.pump();

    await tester.enterText(taskInputField, 'Test Task 2');
    await tester.tap(addButton);
    await tester.pump();

    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);
  });
}
