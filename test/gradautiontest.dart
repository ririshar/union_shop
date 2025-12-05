import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/graduation_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: GraduationPage(),
    );
  }

  testWidgets('GraduationPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change 'Graduation' to your actual title text if different.
  testWidgets('GraduationPage shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Graduation'), findsOneWidget);
  });

  // Optional: verify there is some scrollable content (list of items, etc.).
  testWidgets('GraduationPage has scrollable content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });
}
