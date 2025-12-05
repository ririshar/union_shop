//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\halloween_page.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class HalloweenPage extends StatelessWidget {
  const HalloweenPage({super.key});

  void _placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            const SizedBox(height: 40),

            // Centered title + price row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT: images column
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        // Main image
                        AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Image.asset(
                            'assets/images/bootote.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Thumbnails row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _ThumbImage(
                              'assets/images/pumpkintote.png',
                            ),
                            SizedBox(width: 12),
                            _ThumbImage(
                              'assets/images/pumpkintote.png',
                            ),
                            SizedBox(width: 12),
                            _ThumbImage(
                              'assets/images/bootote.png',
                            ),
                            SizedBox(width: 12),
                            _ThumbImage(
                              'assets/images/ghosttote.png',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: isWide ? 64 : 32),

                  // RIGHT: product info / controls
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Halloween Tote Bags',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '£2.50',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Tax included.',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Option + quantity row
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Halloween Tote Bag',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: 'Hello Pumpkin',
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Hello Pumpkin',
                                            child: Text('Hello Pumpkin'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Spooky Boo',
                                            child: Text('Spooky Boo'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Ghost Design',
                                            child: Text('Ghost Design'),
                                          ),
                                        ],
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Quantity',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('1'),
                                        Icon(
                                          Icons.expand_more,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Buttons
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'ADD TO CART',
                              style: TextStyle(letterSpacing: 1.1),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFF5a2ca0), // purple-ish
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text('Buy with shop'),
                          ),
                        ),

                        const SizedBox(height: 12),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'More payment options',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Description text (shortened to fit)
                        const Text(
                          'Trick or treat yourself to one of these limited edition '
                          'Halloween tote bags! Available to purchase in store & online '
                          'for just £2.50!!!',
                          style: TextStyle(fontSize: 13, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Due to the hand crafted nature of this item, final product '
                          'may differ slightly from original design.',
                          style: TextStyle(fontSize: 13, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Designs will be printed after purchase and be available up '
                          'to two working days later.',
                          style: TextStyle(fontSize: 13, height: 1.4),
                        ),

                        const SizedBox(height: 24),

                        // Social icons placeholder row
                        const Row(
                          children: [
                            Icon(Icons.share, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'SHARE   TWEET   PIN IT',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class _ThumbImage extends StatelessWidget {
  final String assetPath;
  const _ThumbImage(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
