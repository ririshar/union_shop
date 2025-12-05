import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_page.dart'; // adjust filename if needed

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: SalePage(), // adjust class name if needed
    );
  }

  testWidgets('SalePage builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change 'Sale' to your actual title text if different, e.g. 'On Sale' or 'Sale Items'.
  testWidgets('SalePage shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Sale'), findsOneWidget);
  });

  // Optional: verify there is some scrollable list/grid of sale items.
  testWidgets('SalePage has scrollable sale content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });

  // Optional: verify at least one price-like text, assuming you use '£'.
  testWidgets('SalePage shows at least one discounted price',
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
