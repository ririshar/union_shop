import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // TopHeader, AppFooter, ProductCard
import 'package:union_shop/product.dart'; // your original Product model
import 'package:union_shop/product_filters.dart'; // your original filters widget

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  // ORIGINAL clothing products + hats / beanie
  final List<Product> _allProducts = const [
    Product(
      title: 'Classic Hoodie',
      price: '£25.00',
      imageUrl: 'assets/images/classichoodie.png',
      category: 'Hoodie',
      colour: 'Purple',
      size: 'XS-XL',
    ),
    Product(
      title: 'Classic Hoodie (Grey)',
      price: '£25.00',
      imageUrl: 'assets/images/classicsweatshirt.png',
      category: 'Hoodie',
      colour: 'Grey',
      size: 'XS-XL',
    ),
    Product(
      title: 'Classic Hoodie (Black)',
      price: '£25.00',
      imageUrl: 'assets/images/classichoodie.png',
      category: 'Hoodie',
      colour: 'Black',
      size: 'XS-XL',
    ),
    Product(
      title: 'Classic T-Shirt',
      price: '£12.00',
      imageUrl: 'assets/images/classictshirt.png',
      category: 'T‑Shirt',
      colour: 'Purple',
      size: 'XS-XL',
    ),
    Product(
      title: 'Cap',
      price: '£10.00',
      imageUrl: 'assets/images/classiccap.png',
      category: 'Headwear',
      colour: 'Purple',
      size: 'One size',
    ),
    Product(
      title: 'Beanie',
      price: '£10.00',
      imageUrl: 'assets/images/classicbeaniehat.png',
      category: 'Headwear',
      colour: 'Purple',
      size: 'One size',
    ),
  ];

  String? _selectedCategory;
  String? _selectedColour;

  List<Product> get _filteredProducts {
    return _allProducts.where((p) {
      final matchesCategory =
          _selectedCategory == null || p.category == _selectedCategory;
      final matchesColour =
          _selectedColour == null || p.colour == _selectedColour;
      return matchesCategory && matchesColour;
    }).toList();
  }

  void _placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final categories = _allProducts.map((p) => p.category).toSet().toList()
      ..sort();
    final colours = _allProducts.map((p) => p.colour).toSet().toList()..sort();

    return Scaffold(
      // If you prefer no app bar because TopHeader already has one, you can remove this.
      appBar: AppBar(
        title: const Text('Clothing'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top header – no extra scroll view, it should handle its own layout
                TopHeader(
                  activeLabel: 'Shop',
                  placeholderCallbackForButtons: _placeholderCallbackForButtons,
                ),

                // Main clothing content
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clothing',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Filters bar
                      ProductFilters(
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

                      const SizedBox(height: 24),

                      // Product grid using ProductCard
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final crossAxisCount =
                              constraints.maxWidth > 800 ? 3 : 2;
                          final childAspectRatio =
                              constraints.maxWidth / (crossAxisCount * 300);

                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: childAspectRatio,
                            children: _filteredProducts.map((p) {
                              return ProductCard(
                                title: p.title,
                                price: p.price,
                                originalPrice: p.originalPrice,
                                imageUrl: p.imageUrl,
                                highlightPrice: p.originalPrice == null,
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Footer – again, no extra scroll view
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
