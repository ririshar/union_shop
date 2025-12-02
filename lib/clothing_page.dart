import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class ClothingPage extends StatelessWidget {
  const ClothingPage({super.key});

  void placeholderCallbackForButtons() {
    // Placeholder for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TopHeader with activeLabel 'Shop'
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: placeholderCallbackForButtons,
            ),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: const Color(0xFF4d2963),
              child: const Text(
                'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            // Clothing page title
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: const Center(
                child: Text(
                  'Clothing',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            // Clothing products grid
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  ProductCard(
                    title: 'Purple Hoodie',
                    price: '£25.00',
                    imageUrl: 'assets/images/purple_hoodie.png',
                  ),
                  ProductCard(
                    title: 'Green Sweatshirt',
                    price: '£20.00',
                    imageUrl: 'assets/images/green_sweatshirt.png',
                  ),
                  ProductCard(
                    title: 'Black T-Shirt',
                    price: '£15.00',
                    imageUrl: 'assets/images/black_tshirt.png',
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
          tab('Shop',
              onTap: () => Navigator.of(context).pushNamed('/shop/clothing')),
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
