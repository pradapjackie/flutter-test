// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttertest/main.dart';

void main() {


  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);

  });
  testWidgets('Validate the calendar click', (WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.animation));
    await tester.pump();
  });

  testWidgets('Validate the access time', (WidgetTester tester) async {

    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pump();
  });
  testWidgets('Validate the access time', (WidgetTester tester) async {

    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();
    expect(find.textContaining('First Name'), findsOneWidget);
    expect(find.textContaining('Last Name'), findsOneWidget);
  });
}
