// filepath: c:\Users\riris\Desktop\Union shop\union_shop\test\clothing_page_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/clothing_page.dart';
import 'package:union_shop/product_filters.dart';

void main() {
  Widget buildTestApp() {
    return const MaterialApp(
      home: ClothingPage(),
    );
  }

  // Very simple test: just check the title is present
  testWidgets('ClothingPage has Clothing title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    expect(find.text('Clothing'), findsOneWidget);
  });

  testWidgets('ClothingPage builds and shows title',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());

    expect(find.text('Clothing'), findsOneWidget);
  });

  testWidgets('ClothingPage shows ProductFilters widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());

    expect(find.byType(ProductFilters), findsOneWidget);
  });

  testWidgets('ClothingPage shows some products initially',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    // Titles from _allProducts in ClothingPage
    expect(find.text('Classic Hoodie'), findsOneWidget);

  });

    // Simple sanity check: page can be pumped without errors and has a Scaffold
  }