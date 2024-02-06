import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttertest/main.dart';

void main() {
  testWidgets('Generate Random Month Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());


    var calendarTodayIcon = find.byIcon(Icons.calendar_today);
    expect(calendarTodayIcon, findsOneWidget);

    await tester.tap(find.byIcon(Icons.calendar_today));
    await tester.pump();
    expect(find.text("Random Month:"), findsOneWidget);


  });

  testWidgets('Generate Random Country Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Random Country:'), findsOneWidget);

    var publicIcon = find.byIcon(Icons.public);
    expect(publicIcon, findsOneWidget);
    await tester.tap(find.byIcon(Icons.public));
    await tester.pump();

    expect(find.textContaining('Random Country:'), findsOneWidget);

  });

  testWidgets('Generate Random Fancy Number Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Random Fancy Number:'), findsOneWidget);
    var confirmationNumberIcon = find.byIcon(Icons.confirmation_number);
    expect(confirmationNumberIcon, findsOneWidget);
    await tester.tap(find.byIcon(Icons.confirmation_number));
    await tester.pump();

    expect(find.textContaining('Random Fancy Number:'), findsOneWidget);
   });

  testWidgets('Generate Random Full Name Test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Random Full Name:'), findsOneWidget);
    var personIcon = find.byIcon(Icons.person);
    expect(personIcon, findsOneWidget);
    await tester.tap(find.byIcon(Icons.person));
    await tester.pump();

    expect(find.textContaining('Random Full Name:'), findsOneWidget);
   });
}
