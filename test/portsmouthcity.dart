import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/portsmouth_city_page.dart'; // adjust filename if needed

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: PortsmouthCityPage(), // adjust class name if needed
    );
  }

  testWidgets('PortsmouthCityPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change this to your actual title text if different.
  testWidgets('PortsmouthCityPage shows its title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Portsmouth City'), findsOneWidget);
  });

  // Optional: verify there is some scrollable content (list/grid of items).
  testWidgets('PortsmouthCityPage has scrollable content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });
}
