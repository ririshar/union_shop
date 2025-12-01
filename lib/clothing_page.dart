import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // only if you need shared widgets like TopHeader/ProductCard; adjust import if different

class ClothingPage extends StatelessWidget {
  const ClothingPage({super.key});

  @override
  Widget build(BuildContext context) {
    void placeholderCallbackForButtons() {}
    final products = [
      {'title': 'Classic Hoodies', 'price': '£25.00', 'image': 'assets/images/shoodie.png'},
      {'title': 'Classic Sweatshirts', 'price': '£23.00', 'image': 'assets/images/sshirt.png'},
      {'title': 'Classic T-Shirts', 'price': '£11.00', 'image': 'assets/images/pink_tshirt.png'},
      {'title': 'Classic Sweatshirts - Neutral', 'price': '£10.99', 'original': '£17.00', 'image': 'assets/images/pink.png'},
      {'title': 'Graduation Hoodies', 'price': '£35.00', 'image': 'assets/images/pinkhoodieessential.png'},
      {'title': 'Graduation 3/4 Zipped', 'price': '£45.00', 'image': 'assets/images/yournamehoodie.png'},
      {'title': 'Classic Cap', 'price': '£12.00', 'image': 'assets/images/postcard.png'},
      {'title': 'Classic Beanie Hat', 'price': '£12.00', 'image': 'assets/images/notebook.png'},
      {'title': 'Classic Rainbow Hoodies', 'price': '£12.99', 'original': '£30.00', 'image': 'assets/images/pizza.png'},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // If you have a TopHeader widget in main.dart, import and use it here.
            // TopHeader(activeLabel: 'Shop', placeholderCallbackForButtons: placeholderCallbackForButtons),

            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: const Center(
                child: Text('Clothing',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final cross = constraints.maxWidth > 1100 ? 3 : (constraints.maxWidth > 700 ? 3 : 1);
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: cross,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    childAspectRatio: 1.6,
                    children: products.map((p) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: (p['image'] ?? '').startsWith('http')
                                  ? Image.network(p['image']!, fit: BoxFit.cover, errorBuilder: (_,__,___) => Container(color: Colors.grey[300]))
                                  : Image.asset(p['image']!, fit: BoxFit.cover, errorBuilder: (_,__,___) => Container(color: Colors.grey[300])),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(p['title'] ?? '', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          if (p.containsKey('original'))
                            Row(
                              children: [
                                Text(p['original']!, style: const TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                                const SizedBox(width: 8),
                                Text(p['price']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                              ],
                            )
                          else
                            Text(p['price']!, style: const TextStyle(fontSize: 13)),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}