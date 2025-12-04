import 'package:flutter/material.dart';
import 'package:union_shop/main.dart'; // for TopHeader & AppFooter if you like, or remove & duplicate header

class ProductDetailArgs {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;
  final List<String> galleryImages;
  final List<String> colours;
  final List<String> sizes;
  final String description;
  final String extraInfo;

  ProductDetailArgs({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    this.galleryImages = const [],
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

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ProductDetailArgs?;

    // Fallback “demo” data if page opened without args.
    final data = args ??
        ProductDetailArgs(
          title: 'Classic Hoodies',
          price: '£25.00',
          imageUrl: 'assets/images/purple_hoodie.png',
          colours: const ['Purple', 'Grey', 'Black'],
          galleryImages: const [
            'assets/images/purple_hoodie.png',
            'assets/images/grey_hoodie.png',
            'assets/images/black_hoodie.png',
          ],
          description:
              'Our best selling Classic Hoodie comes in 5 great colours!\n\n'
              'Double Fabric Hood with self colour flat hood cords, twin needle stitching detail, '
              'kangaroo pouch pocket and ribbed cuff and hem.\n\n'
              'What’s not to love about these University campus hoodies?',
          extraInfo:
              'Want to add your name or course on the back? This product is available for personalisation too.',
        );

    _selectedColour ??= data.colours.isNotEmpty ? data.colours.first : null;
    _selectedSize ??= data.sizes.isNotEmpty ? data.sizes.first : null;

    final gallery =
        data.galleryImages.isNotEmpty ? data.galleryImages : [data.imageUrl];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'Shop',
              placeholderCallbackForButtons: placeholderCallbackForButtons,
            ),

            // Main content
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              color: Colors.white,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LEFT: Main image + thumbnails
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 4 / 5,
                              child: _buildImage(data.imageUrl),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 80,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final thumb = gallery[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        // swap selected image with main
                                        final currentMain = data.imageUrl;
                                        gallery[gallery.indexOf(thumb)] =
                                            currentMain;
                                      });
                                    },
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: _buildImage(thumb),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 8),
                                itemCount: gallery.length,
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Example size chart image / text placeholder
                            const Text(
                              'Size info',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'S  To fit 36" chest\n'
                              'M  To fit 40" chest\n'
                              'L  To fit 44" chest\n'
                              'XL To fit 48" chest\n'
                              '2XL To fit 52" chest',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 40),

                      // RIGHT: Details / selectors
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Tax included.',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 24),

                            // Colour
                            if (data.colours.isNotEmpty) ...[
                              const Text(
                                'Color',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              DropdownButton<String>(
                                value: _selectedColour,
                                isExpanded: true,
                                items: data.colours
                                    .map(
                                      (c) => DropdownMenuItem(
                                        value: c,
                                        child: Text(c),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _selectedColour = v),
                              ),
                              const SizedBox(height: 16),
                            ],

                            // Size
                            if (data.sizes.isNotEmpty) ...[
                              const Text(
                                'Size',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4),
                              DropdownButton<String>(
                                value: _selectedSize,
                                isExpanded: true,
                                items: data.sizes
                                    .map(
                                      (s) => DropdownMenuItem(
                                        value: s,
                                        child: Text(s),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _selectedSize = v),
                              ),
                              const SizedBox(height: 16),
                            ],

                            // Quantity
                            const Text(
                              'Quantity',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove, size: 18),
                                    onPressed: () {
                                      setState(() {
                                        if (_quantity > 1) _quantity--;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$_quantity',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add, size: 18),
                                    onPressed: () {
                                      setState(() => _quantity++);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Buttons
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: hook to cart
                                },
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
                                onPressed: () {
                                  // TODO: hook to external checkout
                                },
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
                            const SizedBox(height: 12),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'More payment options',
                                style: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Description
                            if (data.description.isNotEmpty) ...[
                              Text(
                                data.description,
                                style:
                                    const TextStyle(fontSize: 13, height: 1.4),
                              ),
                              const SizedBox(height: 12),
                            ],
                            if (data.extraInfo.isNotEmpty)
                              Text(
                                data.extraInfo,
                                style: const TextStyle(
                                    fontSize: 13,
                                    height: 1.4,
                                    fontWeight: FontWeight.w500),
                              ),

                            const SizedBox(height: 24),

                            // Social icons row (simple text placeholders)
                            const Row(
                              children: [
                                Icon(Icons.share, size: 16),
                                SizedBox(width: 4),
                                Text('Share'),
                              ],
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

  Widget _buildImage(String url) {
    if (url.startsWith('http')) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.image_not_supported, color: Colors.grey),
          ),
        ),
      );
    } else {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.image_not_supported, color: Colors.grey),
          ),
        ),
      );
    }
  }
}
