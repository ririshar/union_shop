import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: ProductPage(),
    );
  }

  // Just check that ProductPage can build without throwing.
  testWidgets('ProductPage builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Optional: check that some expected title text exists.
  // Change 'Products' to whatever your actual title text is.
  testWidgets('ProductPage has a Products title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Products'), findsOneWidget);
  });
}
