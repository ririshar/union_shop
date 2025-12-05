class ProductDetailArgs {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;
  final List<String> colours;
  final List<String> sizes;
  final String description;
  final String extraInfo;

  /// NEW: per‑product extras
  final bool soldOut;
  final List<String> features; // bullet points
  final String careInstructions;

  ProductDetailArgs({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    required this.colours,
    required this.sizes,
    required this.description,
    required this.extraInfo,
    this.soldOut = false,
    this.features = const [],
    this.careInstructions = '',
  });
}

// Example ProductPage (detail screen)
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArgs;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + main info row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: args.imageUrl.startsWith('http')
                        ? Image.network(args.imageUrl, fit: BoxFit.cover)
                        : Image.asset(args.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 24),

                // text / options
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        args.title,
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          if (args.originalPrice != null)
                            Text(
                              args.originalPrice!,
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                          if (args.originalPrice != null)
                            const SizedBox(width: 8),
                          Text(
                            args.price,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (args.soldOut) ...[
                            const SizedBox(width: 12),
                            const Text(
                              'SOLD OUT',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Sizes dropdown — only if we have sizes
                      if (args.sizes.isNotEmpty) ...[
                        const Text('Size'),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          items: args.sizes
                              .map((s) => DropdownMenuItem(
                                    value: s,
                                    child: Text(s),
                                  ))
                              .toList(),
                          onChanged: args.soldOut ? null : (_) {},
                          value: args.sizes.first,
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Colours dropdown — only if we have colours
                      if (args.colours.isNotEmpty) ...[
                        const Text('Colour'),
                        const SizedBox(height: 4),
                        DropdownButtonFormField<String>(
                          items: args.colours
                              .map((c) => DropdownMenuItem(
                                    value: c,
                                    child: Text(c),
                                  ))
                              .toList(),
                          onChanged: args.soldOut ? null : (_) {},
                          value: args.colours.first,
                        ),
                        const SizedBox(height: 24),
                      ],

                      // Add to basket button (or disabled Sold Out)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: args.soldOut ? null : () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                          ),
                          child: Text(
                            args.soldOut ? 'SOLD OUT' : 'ADD TO BASKET',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Description
            Text(
              'Product Description',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(args.description),

            // Features list
            if (args.features.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Features',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: args.features
                    .map((f) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• '),
                            Expanded(child: Text(f)),
                          ],
                        ))
                    .toList(),
              ),
            ],

            // Care instructions
            if (args.careInstructions.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Care Instructions',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(args.careInstructions),
            ],

            // Extra info (e.g. “Available for personalisation”)
            if (args.extraInfo.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                args.extraInfo,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
