import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/clothing_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: ClothingPage(),
    );
  }

  // Just check that ClothingPage can build without throwing.
  testWidgets('ClothingPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Check that the main "Clothing" title text is present.
  // If your actual title text is different, change the string below.
  testWidgets('ClothingPage has a Clothing title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Clothing'), findsOneWidget);
  });

  // Check that a scroll view exists.
  testWidgets('ClothingPage has a scroll view', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(SingleChildScrollView), findsWidgets);
  });

  // Check that at least one product grid is rendered.
  testWidgets('ClothingPage shows a product grid', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(GridView), findsOneWidget);
  });

  // Optional: check that at least one price-like text (with '£') exists.
  testWidgets('ClothingPage shows at least one price-like text',
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
