import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('Home page builds without errors', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();
    });

    testWidgets('Home page shows main header/title', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      expect(find.text('Union Shop'), findsOneWidget);
    });

    testWidgets('Home page shows at least one section header', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      final sectionHeaders = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data != null &&
            (widget.data!.contains('Clothing') ||
                widget.data!.contains('Merchandise') ||
                widget.data!.contains('Featured') ||
                widget.data!.contains('Products')),
      );

      expect(sectionHeaders, findsWidgets);
    });

    testWidgets('Home page shows some product cards / items', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Home page shows at least one price-like text', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      final priceFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.data != null && widget.data!.contains('£'),
      );

      expect(priceFinder, findsWidgets);
    });

    testWidgets('Home page shows common header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Comment out any icons not actually on your home page.
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsWidgets);
      expect(find.byIcon(Icons.menu), findsWidgets);
    });

    testWidgets('Home page has something that looks like a footer',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      final footerFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.data != null &&
            (widget.data!.contains('Union') ||
                widget.data!.contains('©') ||
                widget.data!.contains('Copyright')),
      );

      expect(footerFinder, findsWidgets);
    });
  });
}
