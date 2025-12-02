//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\clothing_page2.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

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
            // Same top header as page 1
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            const SizedBox(height: 40),

            // "Clothing" title – same as page 1
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

            // FILTER / SORT row – copy of page 1 (adjust horizontal padding to match)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 180.0, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    'FILTER BY  ',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedFilter,
                    items: _filterOptions
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
                      setState(() => _selectedFilter = value);
                    },
                  ),
                  const Spacer(),
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
                  const Spacer(),
                  const Text(
                    '18 products',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // GRID – same layout (padding, spacing, columns) as page 1
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
                children: const [
                  // Row 1
                  ProductCard(
                    title: 'Heavyweight Shorts',
                    originalPrice: '£30.00',
                    price: '£12.99',
                    imageUrl: 'assets/images/heavy_shorts.png',
                  ),
                  ProductCard(
                    title: 'Ladies Athletic Leggings',
                    originalPrice: '£28.00',
                    price: '£12.99',
                    imageUrl: 'assets/images/leggings.png',
                  ),
                  ProductCard(
                    title: 'Signature Hoodie',
                    price: '£32.99',
                    imageUrl: 'assets/images/signature_hoodie.png',
                  ),

                  // Row 2
                  ProductCard(
                    title: 'Essential T-Shirt',
                    originalPrice: '£10.00',
                    price: '£6.99',
                    imageUrl: 'assets/images/essential_tshirt.png',
                  ),
                  ProductCard(
                    title: 'Limited Edition Essential Zip Hoodies',
                    originalPrice: '£22.00',
                    price: '£14.99',
                    imageUrl: 'assets/images/zip_pink.png',
                  ),
                  ProductCard(
                    title: 'Waterproof Poncho',
                    price: '£1.99',
                    imageUrl: 'assets/images/poncho.png',
                  ),

                  // Row 3
                  ProductCard(
                    title: 'Classic Hoodies - Burgundy',
                    originalPrice: '£25.00',
                    price: '£12.00',
                    imageUrl: 'assets/images/burgundy_hoodie.png',
                  ),
                  ProductCard(
                    title: 'Signature T-Shirt',
                    price: '£14.99',
                    imageUrl: 'assets/images/sig_tshirt_blue.png',
                  ),
                  ProductCard(
                    title: 'Limited Edition UoP Beanies',
                    price: '£7.50',
                    imageUrl: 'assets/images/beanies.png',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // PAGER – same style as page 1, but "Page 2 of 2" and only left active
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Back to page 1
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/shop/clothing');
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Page 2 of 2',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 16),
                  // Right arrow disabled on last page
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: null,
                    child: const Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.grey,
                    ),
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
