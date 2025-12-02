//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\signature_essential_page.dart
import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class SignatureEssentialPage extends StatefulWidget {
  const SignatureEssentialPage({super.key});

  @override
  State<SignatureEssentialPage> createState() => _SignatureEssentialPageState();
}

class _SignatureEssentialPageState extends State<SignatureEssentialPage> {
  String _selectedFilter = 'All products';
  String _selectedSort = 'Alphabetically, A–Z';

  final List<String> _filterOptions = ['All products'];
  final List<String> _sortOptions = [
    'Alphabetically, A–Z',
    'Alphabetically, Z–A',
    'Price: Low to High',
    'Price: High to Low',
  ];

  void _placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            const SizedBox(height: 40),

            // Title
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: const Center(
                child: Text(
                  'Signature & Essential Range',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Intro text (shortened copy of screenshot)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 180.0, vertical: 8),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: const Text(
                  'Discover effortless style and comfort with our latest drop – the '
                  'Signature & Essential range. The Signature line features premium '
                  'embroidered hoodies in limited colours, plus the new Signature T‑Shirt, '
                  'combining classic design with elevated details. The Essential line '
                  'offers versatile, must‑have t‑shirts with a fresh chest logo design.\n\n'
                  'Plus, grab the limited edition zip hoodie while stocks last – a standout '
                  'piece designed for those who move differently.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13, height: 1.6, color: Colors.black87),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // FILTER / SORT / product count row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 180.0, vertical: 8),
              child: Row(
                children: [
                  const Text(
                    'FILTER BY  ',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedFilter,
                    items: _filterOptions
                        .map(
                          (v) => DropdownMenuItem<String>(
                            value: v,
                            child:
                                Text(v, style: const TextStyle(fontSize: 10)),
                          ),
                        )
                        .toList(),
                    isDense: true,
                    underline: const SizedBox.shrink(),
                    onChanged: (v) =>
                        setState(() => _selectedFilter = v ?? _selectedFilter),
                  ),
                  const Spacer(),
                  const Text(
                    'SORT BY  ',
                    style: TextStyle(fontSize: 10, color: Colors.black54),
                  ),
                  DropdownButton<String>(
                    value: _selectedSort,
                    items: _sortOptions
                        .map(
                          (v) => DropdownMenuItem<String>(
                            value: v,
                            child:
                                Text(v, style: const TextStyle(fontSize: 10)),
                          ),
                        )
                        .toList(),
                    isDense: true,
                    underline: const SizedBox.shrink(),
                    onChanged: (v) =>
                        setState(() => _selectedSort = v ?? _selectedSort),
                  ),
                  const Spacer(),
                  const Text(
                    '4 products',
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Products grid – 3 on first row, 1 centered on second row
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 0),
              child: Column(
                children: [
                  // Row 1 – 3 products
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 900 ? 3 : 1,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 40,
                    childAspectRatio: 3 / 4,
                    children: const [
                      ProductCard(
                        title: 'Signature T-Shirt',
                        price: '£14.99',
                        imageUrl: 'assets/images/sshirt.png',
                      ),
                      ProductCard(
                        title: 'Signature Hoodie',
                        price: '£32.99',
                        imageUrl: 'assets/images/shoodie.png',
                      ),
                      ProductCard(
                        title: 'Limited Edition Essential Zip Hoodies',
                        originalPrice: '£20.00',
                        price: '£14.99',
                        imageUrl: 'assets/images/pink.png',
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Row 2 – single Essential T-shirt centered
                  Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 320, minWidth: 260),
                      child: const AspectRatio(
                        aspectRatio: 3 / 4,
                        child: ProductCard(
                          title: 'Essential T-Shirt',
                          originalPrice: '£10.00',
                          price: '£6.99',
                          imageUrl: 'assets/images/pink_tshirt.png',
                        ),
                      ),
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
