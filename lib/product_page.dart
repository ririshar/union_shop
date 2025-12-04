import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // for TopHeader & AppFooter

class ProductDetailArgs {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;
  final List<String> colours;
  final List<String> sizes;
  final String description;
  final String extraInfo;

  ProductDetailArgs({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    this.colours = const ['Purple'],
    this.sizes = const ['XS', 'S', 'M', 'L', 'XL'],
    this.description = '',
    this.extraInfo = '',
  });
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? _selectedColour;
  String? _selectedSize;
  int _quantity = 1;

  void _placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ProductDetailArgs?;

    final data = args ??
        ProductDetailArgs(
          title: 'Classic Hoodies',
          price: '£25.00',
          imageUrl: 'assets/images/classichoodie.png',
          colours: const ['Purple', 'Grey', 'Black'],
          description:
              'Our best selling Classic Hoodie comes in great colours!\n\n'
              'Double fabric hood with flat cords, twin needle stitching detail, '
              'kangaroo pouch pocket and ribbed cuff and hem.\n\n'
              'What’s not to love about these University campus hoodies?',
          extraInfo:
              'Want to add your name or course on the back? This product is available for personalisation too.',
        );

    _selectedColour ??= data.colours.first;
    _selectedSize ??= data.sizes.first;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: _placeholderCallbackForButtons,
            ),

            // main content, simplified
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LEFT: image
                      Expanded(
                        flex: 3,
                        child: AspectRatio(
                          aspectRatio: 4 / 5,
                          child: Image.asset(
                            data.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(Icons.image_not_supported,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      // RIGHT: details
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                if (data.originalPrice != null)
                                  Text(
                                    data.originalPrice!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                if (data.originalPrice != null)
                                  const SizedBox(width: 8),
                                Text(
                                  data.price,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Tax included.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 24),
                            const Text('Color',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            DropdownButton<String>(
                              value: _selectedColour,
                              isExpanded: true,
                              items: data.colours
                                  .map((c) => DropdownMenuItem(
                                        value: c,
                                        child: Text(c),
                                      ))
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => _selectedColour = v),
                            ),
                            const SizedBox(height: 16),
                            const Text('Size',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            DropdownButton<String>(
                              value: _selectedSize,
                              isExpanded: true,
                              items: data.sizes
                                  .map((s) => DropdownMenuItem(
                                        value: s,
                                        child: Text(s),
                                      ))
                                  .toList(),
                              onChanged: (v) =>
                                  setState(() => _selectedSize = v),
                            ),
                            const SizedBox(height: 16),
                            const Text('Quantity',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, size: 18),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 1) _quantity--;
                                    });
                                  },
                                ),
                                Text('$_quantity'),
                                IconButton(
                                  icon: const Icon(Icons.add, size: 18),
                                  onPressed: () {
                                    setState(() => _quantity++);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: const Text(
                                  'Buy with Shop',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            if (data.description.isNotEmpty)
                              Text(
                                data.description,
                                style:
                                    const TextStyle(fontSize: 13, height: 1.4),
                              ),
                            const SizedBox(height: 12),
                            if (data.extraInfo.isNotEmpty)
                              Text(
                                data.extraInfo,
                                style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
