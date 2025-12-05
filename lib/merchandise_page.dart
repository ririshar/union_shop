//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\merchandise_page.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // TopHeader, AppFooter, ProductCard
import 'package:union_shop/product.dart';
import 'package:union_shop/product_filters.dart';

class MerchandisePage extends StatefulWidget {
  const MerchandisePage({super.key});

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  void _placeholderCallbackForButtons() {}

  // Full merchandise list (mapped from your existing grid)
  final List<Product> _allProducts = const [
    Product(
      title: 'ID Holders',
      price: '£0.75',
      imageUrl: 'assets/images/idholder.png',
      category: 'Accessories',
      colour: 'Purple',
      size: 'One size',
    ),
    Product(
      title: 'Lanyards',
      price: '£2.75',
      imageUrl: 'assets/images/lanyard.png',
      category: 'Accessories',
      colour: 'Purple',
      size: 'One size',
    ),
    Product(
      title: 'Graduation bears',
      price: '£0.00', // sold out, real price irrelevant
      imageUrl: 'assets/images/graduationbear.png',
      category: 'Gifts',
      colour: 'Brown',
      size: 'One size',
      soldOut: true,
    ),
    Product(
      title: 'UoP Cotton Shopper',
      price: '£1.99',
      imageUrl: 'assets/images/cottonshopper.png',
      category: 'Bags',
      colour: 'Natural',
      size: 'One size',
    ),
    Product(
      title: 'Rainbow Lanyard',
      price: '£2.75',
      imageUrl: 'assets/images/rainbowlanyard.png',
      category: 'Accessories',
      colour: 'Rainbow',
      size: 'One size',
    ),
    Product(
      title: 'Pen',
      price: '£1.00',
      imageUrl: 'assets/images/pen.png',
      category: 'Stationery',
      colour: 'Purple',
      size: 'One size',
    ),
    Product(
      title: 'Lapel Pin',
      price: '£4.00',
      imageUrl: 'assets/images/lapelpin.png',
      category: 'Accessories',
      colour: 'Silver',
      size: 'One size',
    ),
    Product(
      title: 'Crested Tie',
      originalPrice: '£15.00',
      price: '£10.99',
      imageUrl: 'assets/images/graduationtie.png',
      category: 'Accessories',
      colour: 'Navy',
      size: 'One size',
    ),
    Product(
      title: 'Crested Badge',
      originalPrice: '£7.00',
      price: '£4.99',
      imageUrl: 'assets/images/graduationbadge.png',
      category: 'Accessories',
      colour: 'Gold',
      size: 'One size',
    ),
  ];

  String? _selectedCategory;
  String? _selectedColour;

  // sort mode text
  String _selectedSort = 'Best selling';
  final List<String> _sortOptions = const [
    'Best selling',
    'Price: Low to High',
    'Price: High to Low',
    'Alphabetically, A–Z',
  ];

  // helpers to parse price strings like "£4.99"
  double _priceValue(Product p) {
    final stripped = p.price.replaceAll('£', '').trim();
    return double.tryParse(stripped) ?? 0.0;
  }

  List<Product> get _filteredAndSortedProducts {
    final filtered = _allProducts.where((p) {
      final matchesCategory =
          _selectedCategory == null || p.category == _selectedCategory;
      final matchesColour =
          _selectedColour == null || p.colour == _selectedColour;
      return matchesCategory && matchesColour;
    }).toList();

    switch (_selectedSort) {
      case 'Price: Low to High':
        filtered.sort((a, b) => _priceValue(a).compareTo(_priceValue(b)));
        break;
      case 'Price: High to Low':
        filtered.sort((a, b) => _priceValue(b).compareTo(_priceValue(a)));
        break;
      case 'Alphabetically, A–Z':
        filtered.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Best selling':
      default:
        // keep original order
        break;
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final categories = _allProducts.map((p) => p.category).toSet().toList()
      ..sort();
    final colours = _allProducts.map((p) => p.colour).toSet().toList()..sort();

    final products = _filteredAndSortedProducts;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            const SizedBox(height: 40),

            // Title
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const Center(
                child: Text(
                  'Merchandise',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // FILTER / SORT / product count row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 180.0, vertical: 8),
              child: Row(
                children: [
                  // left: type/colour filters
                  Expanded(
                    child: ProductFilters(
                      categories: categories,
                      colours: colours,
                      selectedCategory: _selectedCategory,
                      selectedColour: _selectedColour,
                      onCategoryChanged: (value) {
                        setState(() => _selectedCategory = value);
                      },
                      onColourChanged: (value) {
                        setState(() => _selectedColour = value);
                      },
                    ),
                  ),

                  const SizedBox(width: 16),

                  // sort + count
                  const Text(
                    'SORT BY  ',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: _sortOptions
                        .map(
                          (value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        )
                        .toList(),
                    isDense: true,
                    underline: const SizedBox.shrink(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _selectedSort = value);
                    },
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${products.length} products',
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Product grid using ProductCard
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 1,
                crossAxisSpacing: 32,
                mainAxisSpacing: 40,
                childAspectRatio: 3 / 4,
                children: products.map((p) {
                  return ProductCard(
                    title: p.title,
                    // show "Sold out" text instead of price when soldOut
                    price: p.soldOut ? 'Sold out' : p.price,
                    originalPrice: p.originalPrice,
                    imageUrl: p.imageUrl,
                    highlightPrice: p.originalPrice == null,
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
