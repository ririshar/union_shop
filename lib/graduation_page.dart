import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader, AppFooter, openProductPage

class GraduationPage extends StatelessWidget {
  const GraduationPage({super.key});

  void _placeholder() {}

  @override
  Widget build(BuildContext context) {
    final products = _graduationProducts;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // same top bar + nav as other pages
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholder,
            ),

            // HERO IMAGE + TITLE
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/graduation_hero.jpg',
                    fit: BoxFit.cover,
                  ),
                  // ignore: deprecated_member_use
                  Container(color: Colors.black.withOpacity(0.25)),
                  const Center(
                    child: Text(
                      'Graduation',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // FILTER / SORT BAR + PRODUCT COUNT
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'FILTER BY',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: 'All products',
                          underline: const SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          items: const [
                            DropdownMenuItem(
                              value: 'All products',
                              child: Text('All products'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'SORT BY',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(width: 8),
                        DropdownButton<String>(
                          value: 'Featured',
                          underline: const SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          items: const [
                            DropdownMenuItem(
                              value: 'Featured',
                              child: Text('Featured'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${products.length} products',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // PRODUCT GRID
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 3;
                  if (constraints.maxWidth < 900) crossAxisCount = 2;
                  if (constraints.maxWidth < 600) crossAxisCount = 1;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      childAspectRatio: 0.78,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];

                      return GestureDetector(
                        onTap: () {
                          final description =
                              '${p.name} from our graduation collection.\n\n'
                              'Perfect for celebrating your big day or as a keepsake afterwards.';
                          const extraInfo =
                              'Graduation products are available for a limited time around ceremonies.';

                          openProductPage(
                            context,
                            title: p.name,
                            price: p.price != null
                                ? '£${p.price!.toStringAsFixed(2)}'
                                : '£0.00',
                            originalPrice: p.compareAtPrice != null
                                ? '£${p.compareAtPrice!.toStringAsFixed(2)}'
                                : null,
                            imageUrl: p.imagePath,
                            description: description,
                            extraInfo: extraInfo,
                          );
                        },
                        child: _GraduationProductCard(product: p),
                      );
                    },
                  );
                },
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────────────────────
// DATA + WIDGETS
// ──────────────────────────────────────────────────────────────────────────────

class GraduationProduct {
  final String name;
  final String imagePath;
  final double? price; // current price
  final double? compareAtPrice; // crossed‑out price
  final bool soldOut;

  GraduationProduct({
    required this.name,
    required this.imagePath,
    this.price,
    this.compareAtPrice,
    this.soldOut = false,
  });
}

final List<GraduationProduct> _graduationProducts = [
  GraduationProduct(
    name: 'Graduation Hoodies',
    imagePath: 'assets/images/graduationhoodie.jpg',
    price: 35.00,
  ),
  GraduationProduct(
    name: 'Graduation bears',
    imagePath: 'assets/images/graduationbear.png',
    soldOut: true,
  ),
  GraduationProduct(
    name: 'Graduation 3/4 Zipped Sweatshirt',
    imagePath: 'assets/images/threeziphoodie.jpg',
    price: 45.00,
  ),
  GraduationProduct(
    name: 'Crested Tie',
    imagePath: 'assets/images/graduationtie.png',
    price: 10.99,
    compareAtPrice: 15.00,
  ),
  GraduationProduct(
    name: 'Crested Notebook',
    imagePath: 'assets/images/graduationnotebook.png',
    price: 7.99,
    compareAtPrice: 10.50,
  ),
  GraduationProduct(
    name: 'Crested Badge',
    imagePath: 'assets/images/graduationbadge.png',
    price: 4.99,
    compareAtPrice: 7.00,
  ),
  GraduationProduct(
    name: 'Waterproof Poncho',
    imagePath: 'assets/images/graduationponcho.png',
    price: 1.99,
  ),
  GraduationProduct(
    name: 'Graduation Cotton Shopper',
    imagePath: 'assets/images/graduationbag.png',
    price: 2.50,
  ),
];

class _GraduationProductCard extends StatelessWidget {
  final GraduationProduct product;

  const _GraduationProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final hasPrice = product.price != null;
    final hasCompare = product.compareAtPrice != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[300]),
                  ),
                ),
              ),
              if (product.soldOut)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.75),
                    child: const Text(
                      'SOLD OUT',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        if (product.soldOut)
          const Text(
            'Sold out',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          )
        else if (hasPrice && hasCompare)
          Row(
            children: [
              Text(
                '£${product.compareAtPrice!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '£${product.price!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        else if (hasPrice)
          Text(
            '£${product.price!.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
