import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: PrintShackPage(), // Ensure PrintShackPage is defined and imported correctly
    );
  }

  testWidgets('PrintShackPage builds without errors',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();
  });

  // Change 'Print Shack' to your actual title text if different.
  testWidgets('PrintShackPage shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.text('Print Shack'), findsOneWidget);
  });

  // Optional: verify there is some scrollable content (list/grid of services/items).
  testWidgets('PrintShackPage has scrollable content',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    expect(find.byType(Scrollable), findsWidgets);
  });
}

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Shack'),
      ),
      body: const Center(
        child: Text('Welcome to Print Shack!'),
      ),
    );
  }
}
