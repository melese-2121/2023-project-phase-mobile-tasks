import 'package:flutter_test/flutter_test.dart';
import 'package:task_route/main.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Test onboarding page navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to To-Do App'), findsOneWidget);

    final Finder onboardingButton = find.byKey(const Key('onboardingButton'));

    await tester.tap(onboardingButton);
    await tester.pumpAndSettle();

    expect(find.text('No tasks available'), findsOneWidget);
  });
}
