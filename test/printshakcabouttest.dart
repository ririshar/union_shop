import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_about_page.dart'; // adjust filename if needed

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: PrintShackAboutPage(), // adjust class name if needed
    );
  }

  testWidgets('PrintShackAboutPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change this text to your actual about-page title.
  testWidgets('PrintShackAboutPage shows its title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Print Shack About Us'), findsOneWidget);
  });

  // Check that there is some longer descriptive text on the page.
  testWidgets('PrintShackAboutPage shows descriptive text',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    final descriptionFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text &&
          widget.data != null &&
          widget.data!.length > 30, // "long-ish" body text
    );

    expect(descriptionFinder, findsWidgets);
  });
}
