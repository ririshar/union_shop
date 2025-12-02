//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\clothing_page_two.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // for TopHeader, ProductCard, AppFooter

class ClothingPageTwo extends StatefulWidget {
  const ClothingPageTwo({super.key});

  @override
  State<ClothingPageTwo> createState() => _ClothingPageTwoState();
}

class _ClothingPageTwoState extends State<ClothingPageTwo> {
  void _placeholderCallbackForButtons() {}

  String _selectedFilter = 'All products';
  String _selectedSort = 'Featured';

  final List<String> _filterOptions = [
    'All products',
    'Hoodies',
    'Sweatshirts',
    'T-Shirts',
    'Accessories',
  ];

  final List<String> _sortOptions = [
    'Featured',
    'Price: Low to High',
    'Price: High to Low',
    'Alphabetical',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const Center(
                child: Text(
                  'Clothing',
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

            // FILTER / SORT BAR
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    'FILTER BY  ',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedFilter,
                    items: _filterOptions
                        .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    underline: const SizedBox.shrink(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedFilter = value;
                      });
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'SORT BY  ',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: _sortOptions
                        .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    underline: const SizedBox.shrink(),
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() {
                        _selectedSort = value;
                      });
                    },
                  ),
                  const Spacer(),
                  const Text(
                    '18 products',
                    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // GRID WITH DIFFERENT PRODUCTS
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: GridView.count(
                crossAxisCount: MediaQuery.of(context).size.width > 900
                    ? 3
                    : (MediaQuery.of(context).size.width > 600 ? 2 : 1),
                crossAxisSpacing: 24,
                mainAxisSpacing: 32,
                childAspectRatio: 3 / 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ProductCard(
                    title: 'Limited Edition Hoodie',
                    price: '£29.99',
                    imageUrl: 'assets/images/purple_hoodie.png',
                  ),
                  ProductCard(
                    title: 'Logo Sweatshirt',
                    price: '£24.99',
                    imageUrl: 'assets/images/green_sweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Logo T-Shirt',
                    price: '£13.00',
                    imageUrl: 'assets/images/black_tshirt.png',
                  ),
                  ProductCard(
                    title: 'Varsity Jacket',
                    price: '£40.00',
                    imageUrl: 'assets/images/grey_hoodie.png',
                  ),
                  ProductCard(
                    title: 'Sport Hoodie',
                    price: '£36.00',
                    imageUrl: 'assets/images/white_tshirt.png',
                  ),
                  ProductCard(
                    title: 'Sport T-Shirt',
                    price: '£18.00',
                    imageUrl: 'assets/images/navy_sweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Scarf',
                    price: '£14.00',
                    imageUrl: 'assets/images/zip_hoodie.png',
                  ),
                  ProductCard(
                    title: 'Mittens',
                    price: '£9.50',
                    imageUrl: 'assets/images/crew_sweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Winter Bundle',
                    originalPrice: '£50.00',
                    price: '£39.99',
                    imageUrl: 'assets/images/logo_tshirt.png',
                  ),
                ],
              ),
            ),

            // PAGER: 2 of 2 (back arrow active, next disabled)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/shop/clothing');
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '2 of 2',
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(width: 8),
                  const IconButton(
                    icon: Icon(Icons.chevron_right, color: Colors.grey),
                    onPressed: null,
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
