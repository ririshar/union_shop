import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pride_collection_page.dart'; // adjust filename if needed

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: PrideCollectionPage(), // adjust class name if needed
    );
  }

  testWidgets('PridePage builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change this to your actual title text if different.
  testWidgets('PridePage shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Pride'), findsOneWidget);
  });

  // Optional: verify there is some scrollable content (list/grid of Pride items).
  testWidgets('PridePage has scrollable content', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });
}
