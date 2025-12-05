import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader, AppFooter, ProductCard

class PrideCollectionPage extends StatelessWidget {
  const PrideCollectionPage({super.key});

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: placeholderCallbackForButtons,
            ),

            // Page title
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: const Text(
                'Pride Collection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Filter / sort bar
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Row(
                  children: [
                    const Text(
                      'FILTER BY',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: 'all',
                      items: const [
                        DropdownMenuItem(
                          value: 'all',
                          child: Text('All products'),
                        ),
                      ],
                      onChanged: (_) {},
                      underline: const SizedBox.shrink(),
                    ),
                    const Spacer(),
                    const Text(
                      'SORT BY',
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                    const SizedBox(width: 12),
                    DropdownButton<String>(
                      value: 'featured',
                      items: const [
                        DropdownMenuItem(
                          value: 'featured',
                          child: Text('Featured'),
                        ),
                      ],
                      onChanged: (_) {},
                      underline: const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),

            // Products grid – left aligned, equal card heights
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final maxWidth = constraints.maxWidth;
                    final crossAxisCount =
                        maxWidth > 900 ? 3 : (maxWidth > 600 ? 2 : 1);

                    return Align(
                      alignment: Alignment.topLeft, // keep partial rows left
                      child: SizedBox(
                        width: maxWidth,
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 40,
                          childAspectRatio: 0.7,
                          children: const [
                            // 1
                            _FixedHeightProduct(
                              child: ProductCard(
                                title: 'Classic Rainbow Hoodies',
                                originalPrice: '£30.00',
                                price: '£12.99',
                                imageUrl: 'assets/images/rainbowhoodie.png',
                              ),
                            ),
                            // 2
                            _FixedHeightProduct(
                              child: ProductCard(
                                title: 'Pride Flag Pin',
                                originalPrice: '£1.00',
                                price: '£0.50',
                                imageUrl: 'assets/images/pridepin.png',
                              ),
                            ),
                            // 3
                            _FixedHeightProduct(
                              child: ProductCard(
                                title: 'Rainbow Lanyard',
                                price: '£2.75',
                                imageUrl: 'assets/images/rainbowlanyard.png',
                              ),
                            ),
                            // 4
                            _FixedHeightProduct(
                              child: ProductCard(
                                title: 'Pride Silicone Bracelet',
                                price: '£1.00',
                                imageUrl: 'assets/images/pridebracelet.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

/// Wraps ProductCard so all items share the same height in the grid.
class _FixedHeightProduct extends StatelessWidget {
  final Widget child;
  const _FixedHeightProduct({required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320, // adjust if you want cards taller/shorter
      child: child,
    );
  }
}
