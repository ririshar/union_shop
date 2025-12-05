import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  Widget buildTestApp() {
    return const UnionShopApp();
  }

  group('Search Tests', () {
    testWidgets('Search icon is visible on home page', (tester) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pump();

      expect(find.byIcon(Icons.search), findsWidgets);
    });

    testWidgets('Tapping search icon shows a text field', (tester) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pump();

      // Tap the search icon.
      await tester.tap(find.byIcon(Icons.search).first);
      await tester.pumpAndSettle();

      // Look for a TextField (adjust if you use SearchBar or TextFormField).
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('User can type into search field', (tester) async {
      await tester.pumpWidget(buildTestApp());
      await tester.pump();

      // Open search.
      await tester.tap(find.byIcon(Icons.search).first);
      await tester.pumpAndSettle();

      // Find the first TextField and enter some text.
      final textFieldFinder = find.byType(TextField).first;

      await tester.enterText(textFieldFinder, 'hoodie');
      await tester.pump();

      // Confirm the text appears in the widget tree.
      expect(find.text('hoodie'), findsWidgets);
    });
  });
}
