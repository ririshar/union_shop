////dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\sale_page.dart
import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader + AppFooter

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  void _placeholder() {}

  @override
  Widget build(BuildContext context) {
    final products = _saleProducts;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'SALE!',
              placeholderCallbackForButtons: _placeholder,
            ),

            // PAGE TITLE + INTRO
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: const Column(
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'SALE',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Don't miss out! Get yours before they're all gone!",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'All prices shown are inclusive of the discount 🧾',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(height: 1),

            // FILTER / SORT BAR + PRODUCT COUNT
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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
                          value: 'Best selling',
                          underline: const SizedBox(),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          items: const [
                            DropdownMenuItem(
                              value: 'Best selling',
                              child: Text('Best selling'),
                            ),
                          ],
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${products.length} products',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // PRODUCT GRID
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 4;
                  if (constraints.maxWidth < 1100) crossAxisCount = 3;
                  if (constraints.maxWidth < 800) crossAxisCount = 2;
                  if (constraints.maxWidth < 500) crossAxisCount = 1;

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
                              '${p.name} is now on sale.\n\nGrab it while stocks last at a reduced price.';
                          const extraInfo =
                              'Sale items are subject to limited availability and may not be restocked.';

                          openProductPage(
                            context,
                            title: p.name,
                            price: p.price,
                            originalPrice: p.originalPrice,
                            imageUrl: p.imagePath,
                            description: description,
                            extraInfo: extraInfo,
                          );
                        },
                        child: _SaleProductCard(product: p),
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

class SaleProduct {
  final String name;
  final String imagePath;
  final String? originalPrice;
  final String price;
  final bool soldOut;

  SaleProduct({
    required this.name,
    required this.imagePath,
    required this.price,
    this.originalPrice,
    this.soldOut = false,
  });
}

// Dummy data – adjust names / prices / images to match your real sale items.
final List<SaleProduct> _saleProducts = [
  SaleProduct(
    name: 'A5 Notepad',
    imagePath: 'assets/images/notebook.png',
    price: '£1.80',
    soldOut: true,
  ),
  SaleProduct(
    name: 'Classic Sweatshirts – Neutral',
    imagePath: 'assets/images/classicsweatshirt.png',
    originalPrice: '£17.00',
    price: '£10.99',
  ),
  SaleProduct(
    name: 'Recycled Notebook',
    imagePath: 'assets/images/notebook.png',
    price: '£1.80',
  ),

  // Row 2
  SaleProduct(
    name: 'iPhone 5/6 Charge & Sync Cable',
    imagePath: 'assets/images/sale_iphone56_cable.jpg',
    originalPrice: '£3.00',
    price: '£1.50',
  ),
  SaleProduct(
    name: 'Type C Charge & Sync Cable',
    imagePath: 'assets/images/cable.png',
    originalPrice: '£3.00',
    price: '£1.50',
  ),
  SaleProduct(
    name: 'USB to USB Charge & Sync Cables',
    imagePath: 'assets/images/cable.png',
    originalPrice: '£3.00',
    price: '£1.50',
  ),

  // Row 3
  SaleProduct(
    name: 'Dimple Pop Fidget Keyring',
    imagePath: 'assets/images/popkeyring.png',
    originalPrice: '£1.50',
    price: '£0.99',
  ),
  SaleProduct(
    name: 'Nike Academy 18 Tech Pants (W)',
    imagePath: 'assets/images/nikepantsw.png',
    originalPrice: '£24.99',
    price: '£7.00',
  ),
  SaleProduct(
    name: 'Nike Academy 18 Tech Pants (M)',
    imagePath: 'assets/images/nikepantsm.png',
    originalPrice: '£24.99',
    price: '£7.00',
    soldOut: true,
  ),
];

class _SaleProductCard extends StatelessWidget {
  final SaleProduct product;
  const _SaleProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            product.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.image_not_supported, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        Text(
          product.name,
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        if (product.soldOut)
          Text(
            'Sold out',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: Colors.grey.shade700),
          )
        else if (product.originalPrice != null)
          Row(
            children: [
              Text(
                product.originalPrice!,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                product.price,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        else
          Text(
            product.price,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
      ],
    );
  }
}
