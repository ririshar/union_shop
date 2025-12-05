import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/merchandise_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: MerchandisePage(),
    );
  }

  // Just check that MerchandisePage can build without throwing.
  testWidgets('MerchandisePage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Optional: check that some expected title text exists.
  // Change 'Merchandise' to whatever your real title text is.
  testWidgets('MerchandisePage has a Merchandise title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Merchandise'), findsOneWidget);
  });
}