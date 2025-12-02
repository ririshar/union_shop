import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader, AppFooter, ProductCard

class PortsmouthCityPage extends StatelessWidget {
  const PortsmouthCityPage({super.key});

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: placeholderCallbackForButtons,
            ),

            // Hero banner image
            Container(
              width: double.infinity,
              height: 260,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.55),
                child: const Text(
                  'Portsmouth City Collection',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // Intro copy
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portsmouth City Collection',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "We're excited to launch the Portsmouth City Collection, featuring products by renowned British illustrator Julia Gash, now available in our Students’ Union Shop!\n\n"
                      "This unique collection celebrates our vibrant city through Julia's iconic hand-drawn style – full of charm, character, and local landmarks that students and visitors alike will instantly recognise. From the Spinnaker Tower to The King’s Theatre, each design captures the spirit of Portsmouth in bold lines and colourful detail.\n\n"
                      "Available in postcards, magnets, bookmarks and water bottles, these items make perfect mementos, gifts, or affordable keepsakes – whether you’re a new student, proud local, or just passing through.",
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ],
                ),
              ),
            ),

            // Filter / sort bar (non‑functional, visual only for now)
            Container(
              width: double.infinity,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Row(
                  children: [
                    const Text(
                      'FILTER BY',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'all',
                      items: const [
                        DropdownMenuItem(
                            value: 'all', child: Text('All products')),
                      ],
                      onChanged: (_) {},
                      underline: const SizedBox.shrink(),
                    ),
                    const Spacer(),
                    const Text(
                      'SORT BY',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: 'best',
                      items: const [
                        DropdownMenuItem(
                            value: 'best', child: Text('Best selling')),
                      ],
                      onChanged: (_) {},
                      underline: const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),

            // Products grid – 2 columns on wide, 1 on narrow
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: isWide ? 3 : 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 32,
                  childAspectRatio: 0.7,
                  children: const [
                    ProductCard(
                      title: 'Portsmouth City Postcard',
                      price: '£1.00',
                      imageUrl: 'assets/images/postcard.png',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Magnet',
                      price: '£4.50',
                      imageUrl:
                          'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Bookmark',
                      price: '£3.00',
                      imageUrl: 'assets/images/bookmark.png',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Keyring',
                      price: '£6.75',
                      imageUrl: 'assets/images/keyring.png',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Notebook',
                      price: '£7.50',
                      imageUrl: 'assets/images/notebook.png',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Coaster',
                      price: '£4.50',
                      imageUrl: 'assets/images/coaster.png',
                    ),
                    ProductCard(
                      title: 'Portsmouth City Water Bottle',
                      price: '£15.00',
                      imageUrl: 'assets/images/waterbottle.png',
                    ),
                  ],
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
