import 'package:flutter/material.dart';

class GraduationPage extends StatelessWidget {
  const GraduationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = _graduationProducts;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF592C82), // purple bar like site
        title: const Text(
          'The UNION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // HERO IMAGE + TITLE
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/graduation_hero.jpg', // supply your own
                  fit: BoxFit.cover,
                ),
                Container(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.2),
                ),
                Center(
                  child: Text(
                    'Graduation',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
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
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
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
          Expanded(
            child: Container(
              color: Colors.grey.shade50,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 30.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // desktop‑like 3 columns
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.78,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _ProductCard(product: product);
                },
              ),
            ),
          ),
        ],
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
                        ? Colors.redAccent
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
