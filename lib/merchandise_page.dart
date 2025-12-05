//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\merchandise_page.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class MerchandisePage extends StatefulWidget {
  const MerchandisePage({super.key});

  @override
  State<MerchandisePage> createState() => _MerchandisePageState();
}

class _MerchandisePageState extends State<MerchandisePage> {
  void _placeholderCallbackForButtons() {}

  String _selectedFilter = 'All products';
  String _selectedSort = 'Best selling';

  final List<String> _filterOptions = [
    'All products',
    'Accessories',
    'Stationery',
  ];

  final List<String> _sortOptions = [
    'Best selling',
    'Price: Low to High',
    'Price: High to Low',
    'Alphabetically, A–Z',
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

            // Title: "Merchandise"
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
                    '35 products',
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Initial 3‑product row matching your screenshot
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
                    title: 'ID Holders',
                    price: '£0.75',
                    imageUrl: 'assets/images/idholder.png',
                  ),
                  ProductCard(
                    title: 'Lanyards',
                    price: '£2.75',
                    imageUrl: 'assets/images/lanyard.png',
                  ),
                  ProductCard(
                    title: 'Graduation bears',
                    price: 'Sold out',
                    imageUrl: 'assets/images/graduationbear.png',
                  ),

                  // Row 2
                  ProductCard(
                    title: 'UoP Cotton Shopper',
                    price: '£1.99',
                    imageUrl: 'assets/images/cottonshopper.png',
                  ),
                  ProductCard(
                    title: 'Rainbow Lanyard',
                    price: '£2.75',
                    imageUrl: 'assets/images/rainbowlanyard.png',
                  ),
                  ProductCard(
                    title: 'Pen',
                    price: '£1.00',
                    imageUrl: 'assets/images/pen.png',
                  ),

                  // Row 3
                  ProductCard(
                    title: 'Lapel Pin',
                    price: '£4.00',
                    imageUrl: 'assets/images/lapelpin.png',
                  ),
                  ProductCard(
                    title: 'Crested Tie',
                    originalPrice: '£15.00',
                    price: '£10.99',
                    imageUrl: 'assets/images/graduationtie.png',
                  ),
                  ProductCard(
                    title: 'Crested Badge',
                    originalPrice: '£7.00',
                    price: '£4.99',
                    imageUrl: 'assets/images/graduationbadge.png',
                  ),
                ],
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
