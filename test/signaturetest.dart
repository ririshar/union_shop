import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/signature_essential_page.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      // CHANGE THIS to the actual class name from signature_essential_page.dart
      home: SignatureEssentialPage(),
    );
  }

  testWidgets('Signature page builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change 'Signature' to your actual title text if different.
  testWidgets('Signature page shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Signature'), findsOneWidget);
  });

  // Optional: verify there is some scrollable content (list, grid, etc.).
  testWidgets('Signature page has scrollable content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });
}
