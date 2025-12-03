import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader and AppFooter

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

            // HERO IMAGE + TITLE (like screenshot)
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
                  // slight dark overlay
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
                  // 3 columns on wide screens, 2 on medium, 1 on narrow
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
                      final product = products[index];
                      return _ProductCard(product: product);
                    },
                  );
                },
              ),
            ),

            // same footer as home
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
    imagePath: 'assets/images/graduation_hoodie.jpg',
    price: 35.00,
  ),
  GraduationProduct(
    name: 'Graduation bears',
    imagePath: 'assets/images/graduation_bear.jpg',
    soldOut: true,
  ),
  GraduationProduct(
    name: 'Graduation 3/4 Zipped Sweatshirt',
    imagePath: 'assets/images/graduation_sweatshirt.jpg',
    price: 45.00,
  ),
  GraduationProduct(
    name: 'Crested Tie',
    imagePath: 'assets/images/graduation_tie.jpg',
    price: 10.99,
    compareAtPrice: 15.00,
  ),
  GraduationProduct(
    name: 'Crested Notebook',
    imagePath: 'assets/images/graduation_notebook.jpg',
    price: 7.99,
    compareAtPrice: 10.50,
  ),
  GraduationProduct(
    name: 'Crested Badge',
    imagePath: 'assets/images/graduation_badge.jpg',
    price: 4.99,
    compareAtPrice: 7.00,
  ),
  GraduationProduct(
    name: 'Waterproof Poncho',
    imagePath: 'assets/images/graduation_poncho.jpg',
    price: 1.99,
  ),
  GraduationProduct(
    name: 'Graduation Cotton Shopper',
    imagePath: 'assets/images/graduation_bag.jpg',
    price: 2.50,
  ),
];

class _ProductCard extends StatelessWidget {
  final GraduationProduct product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: Colors.white,
            child: Image.asset(
              product.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        if (product.soldOut)
          Text(
            'Sold out',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade700,
            ),
          )
        else
          Row(
            children: [
              if (product.compareAtPrice != null)
                Text(
                  '£${product.compareAtPrice!.toStringAsFixed(2)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey.shade600,
                  ),
                ),
              if (product.compareAtPrice != null) const SizedBox(width: 4),
              if (product.price != null)
                Text(
                  '£${product.price!.toStringAsFixed(2)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: product.compareAtPrice != null
                        ? Colors.black
                        : Colors.black,
                    fontWeight: product.compareAtPrice != null
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
