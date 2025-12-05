import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/product_page.dart';

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
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
            // Header
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

            // FILTER / SORT BAR WITH DROPDOWNS
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

            // Product Grid
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
                  // Row 1
                  ProductCard(
                    title: 'Classic Hoodies',
                    price: '£25.00',
                    imageUrl: 'assets/images/classichoodie.png',
                  ),
                  ProductCard(
                    title: 'Classic Sweatshirts',
                    price: '£23.00',
                    imageUrl: 'assets/images/classicsweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Classic T-Shirts',
                    price: '£11.00',
                    imageUrl: 'assets/images/classictshirt.png',
                  ),

                  // Row 2
                  ProductCard(
                    title: 'Classic Sweatshirts - Neutral',
                    price: '£10.99',
                    originalPrice: '£17.00',
                    imageUrl: 'assets/images/neutralsweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Graduation Hoodie',
                    price: '£35.00',
                    imageUrl: 'assets/images/graduationhoodie.jpg',
                  ),
                  ProductCard(
                    title: 'Graduation 3/4 Zipped Sweatshirt',
                    price: '£45.00',
                    imageUrl: 'assets/images/threeziphoodie.jpg',
                  ),

                  // Row 3
                  ProductCard(
                    title: 'Classic Cap',
                    price: '£12.00',
                    imageUrl:
                        'assets/images/classiccap.png', // update if you have a cap image
                  ),
                  ProductCard(
                    title: 'Classic Beanie Hat',
                    price: '£12.00',
                    imageUrl:
                        'assets/images/classicbeaniehat.png', // update if you have a beanie image
                  ),
                  ProductCard(
                    title: 'Classic Rainbow Hoodies',
                    price: '£12.99',
                    originalPrice: '£30.00',
                    imageUrl:
                        'assets/images/rainbowhoodie.png', // update if you have a rainbow hoodie image
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40.0, top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: null, // first page: no back
                    child: const Icon(
                      Icons.chevron_left,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Page 1 of 2',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed('/shop/clothing/page-2');
                    },
                    child: const Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

/// Reusable ProductCard used in the grid.
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget(String path) {
      if (path.startsWith('http')) {
        return Image.network(
          path,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
        );
      } else {
        return Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
        );
      }
    }

    // Simple per‑product description; you can expand this later.
    String description;
    if (title.contains('Hoodie')) {
      description =
          'Our best selling Classic Hoodie comes in great colours!\n\n'
          'Double fabric hood with flat cords, twin needle stitching detail, '
          'kangaroo pouch pocket and ribbed cuff and hem.\n\n'
          'What’s not to love about these University campus hoodies?';
    } else if (title.contains('Sweatshirt')) {
      description = 'Super comfy classic sweatshirt, perfect for layering.\n\n'
          'Brushed fleece inside, ribbed cuffs and hem, and a relaxed unisex fit.';
    } else if (title.contains('T-Shirt')) {
      description = 'Soft cotton classic T‑shirt with a regular unisex fit.\n\n'
          'Perfect for everyday wear on campus or around the city.';
    } else if (title.contains('Cap') || title.contains('Beanie')) {
      description = 'Finish your look with our classic headwear.\n\n'
          'Ideal for campus, game days and everything in between.';
    } else {
      description = 'Part of our Union Shop clothing collection.\n\n'
          'Designed for everyday comfort with a relaxed unisex fit.';
    }

    const extraInfo =
        'Want to add your name or course on the back? Some products are available for personalisation too.';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/product',
          arguments: ProductDetailArgs(
            title: title,
            price: price,
            originalPrice: originalPrice,
            imageUrl: imageUrl,
            colours: const ['Purple', 'Grey', 'Black'],
            sizes: const ['XS', 'S', 'M', 'L', 'XL'],
            description: description,
            extraInfo: extraInfo,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: imageWidget(imageUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          if (originalPrice != null)
            Row(
              children: [
                Text(
                  originalPrice!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          else
            Text(
              price,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
