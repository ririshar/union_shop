import 'package:flutter/material.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void placeholderCallbackForButtons() {}

    final products = [
      {
        'title': 'Classic Hoodies',
        'price': '£25.00',
        'image': 'assets/images/shoodie.png'
      },
      {
        'title': 'Classic Sweatshirts',
        'price': '£23.00',
        'image': 'assets/images/sshirt.png'
      },
      {
        'title': 'Classic T-Shirts',
        'price': '£11.00',
        'image': 'assets/images/pink_tshirt.png'
      },
      {
        'title': 'Classic Sweatshirts - Neutral',
        'price': '£10.99',
        'original': '£17.00',
        'image': 'assets/images/pink.png'
      },
      {
        'title': 'Graduation Hoodies',
        'price': '£35.00',
        'image': 'assets/images/pinkhoodieessential.png'
      },
      {
        'title': 'Graduation 3/4 Zipped',
        'price': '£45.00',
        'image': 'assets/images/yournamehoodie.png'
      },
      {
        'title': 'Classic Cap',
        'price': '£12.00',
        'image': 'assets/images/postcard.png'
      },
      {
        'title': 'Classic Beanie Hat',
        'price': '£12.00',
        'image': 'assets/images/notebook.png'
      },
      {
        'title': 'Classic Rainbow Hoodies',
        'price': '£12.99',
        'original': '£30.00',
        'image': 'assets/images/pizza.png'
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
                activeLabel: 'Shop',
                placeholderCallbackForButtons: placeholderCallbackForButtons),

            const SizedBox(height: 24),

            // Page title
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: const Center(
                child: Text(
                  'Clothing',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),

            // Filters / sort (simple placeholder)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  const Text('FILTER BY',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: 'All products',
                    items: const [
                      DropdownMenuItem(
                          value: 'All products', child: Text('All products'))
                    ],
                    onChanged: (_) {},
                  ),
                  const Spacer(),
                  const Text('SORT BY',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: 'Featured',
                    items: const [
                      DropdownMenuItem(
                          value: 'Featured', child: Text('Featured'))
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),

            // Product grid 3x3 responsive
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final cross = constraints.maxWidth > 1100
                      ? 3
                      : (constraints.maxWidth > 700 ? 3 : 1);
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: cross,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.6,
                    children: products.map((p) {
                      return ProductCard(
                        title: p['title'] ?? '',
                        price: p['price'] ?? '',
                        originalPrice: p['original'],
                        imageUrl: p['image'] ?? '',
                      );
                    }).toList(),
                  );
                },
              ),
            ),

            // pagination placeholder
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: null, child: Icon(Icons.arrow_back)),
                  SizedBox(width: 12),
                  Text('Page 1 of 2'),
                  SizedBox(width: 12),
                  OutlinedButton(
                      onPressed: null, child: Icon(Icons.arrow_forward)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Minimal TopHeader used by ClothingPage (keeps look/functionality consistent).
class TopHeader extends StatelessWidget {
  final String activeLabel;
  final VoidCallback placeholderCallbackForButtons;
  const TopHeader(
      {super.key,
      this.activeLabel = '',
      required this.placeholderCallbackForButtons});

  @override
  Widget build(BuildContext context) {
    Widget tab(String label, {VoidCallback? onTap}) {
      final active = label == activeLabel;
      return InkWell(
        onTap: onTap ?? placeholderCallbackForButtons,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            label,
            style: TextStyle(
              color: const Color(0xFF4d2963),
              fontSize: 13,
              fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              decoration:
                  active ? TextDecoration.underline : TextDecoration.none,
              decorationColor: const Color(0xFF4d2963),
            ),
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          tab('Home',
              onTap: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (r) => false)),
          // navigate to clothing page
          tab('Shop', onTap: () => Navigator.of(context).pushNamed('/shop/clothing')),
          tab('The Print Shack', onTap: () => placeholderCallbackForButtons()),
          tab('SALE!', onTap: () => placeholderCallbackForButtons()),
          const Spacer(),
          tab('About', onTap: () => Navigator.of(context).pushNamed('/about')),
        ],
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
        return Image.network(path,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]));
      } else {
        return Image.asset(path,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]));
      }
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/product'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: imageWidget(imageUrl)),
          ),
          const SizedBox(height: 8),
          Text(title,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          if (originalPrice != null)
            Row(
              children: [
                Text(originalPrice!,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough)),
                const SizedBox(width: 8),
                Text(price,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700)),
              ],
            )
          else
            Text(price,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
