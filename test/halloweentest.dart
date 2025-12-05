import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/halloween_page.dart'; // adjust filename if needed

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: HalloweenPage(), // adjust class name if needed
    );
  }

  testWidgets('HalloweenPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change 'Halloween' to your actual title text if different.
  testWidgets('HalloweenPage shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Halloween'), findsOneWidget);
  });

  // Optional: verify there is some scrollable list/grid of Halloween items.
  testWidgets('HalloweenPage has scrollable content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });

  // Optional: verify at least one price-like text (assuming '£').
  testWidgets('HalloweenPage shows at least one price',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    final priceFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text && widget.data != null && widget.data!.contains('£'),
    );

    expect(priceFinder, findsWidgets);
  });
}
