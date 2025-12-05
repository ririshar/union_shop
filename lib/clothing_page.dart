import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // for TopHeader, AppFooter, ProductCard
import 'package:union_shop/product.dart';
import 'package:union_shop/product_filters.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  // Full clothing list
  final List<Product> _allProducts = const [
    Product(
      title: 'Limited Edition Essential Zip Hoodie',
      price: '£14.00',
      originalPrice: '£20.00',
      imageUrl: 'assets/images/pink.png',
      category: 'Hoodie',
      colour: 'Pink',
      size: 'XS-XL',
    ),
    Product(
      title: 'Essential T-Shirt',
      price: '£6.00',
      originalPrice: '£10.00',
      imageUrl: 'assets/images/pink_tshirt.png',
      category: 'T‑Shirt',
      colour: 'Pink',
      size: 'XS-XL',
    ),
    Product(
      title: 'Signature Hoodie',
      price: '£32.99',
      imageUrl: 'assets/images/shoodie.png',
      category: 'Hoodie',
      colour: 'Black',
      size: 'XS-XL',
    ),
    Product(
      title: 'Signature T-Shirt',
      price: '£14.99',
      imageUrl: 'assets/images/sshirt.png',
      category: 'T‑Shirt',
      colour: 'Black',
      size: 'XS-XL',
    ),
    // add more clothing here...
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
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

                  // Product grid using ProductCard (so your product page still works)
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 800 ? 3 : 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 24,
                    childAspectRatio: 3 / 4,
                    children: _filteredProducts.map((p) {
                      return ProductCard(
                        title: p.title,
                        price: p.price,
                        originalPrice: p.originalPrice,
                        imageUrl: p.imageUrl,
                        highlightPrice: p.originalPrice == null,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
